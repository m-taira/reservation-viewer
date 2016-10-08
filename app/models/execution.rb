class Execution < ApplicationRecord
  extend Enumerize

  enumerize :kind, in: [:auto, :manual], scope: true

  has_many :reservations, dependent: :destroy

  def manual(date = Date.today)
    self.kind = :manual
    self.execute_datetime = date

    Shop.all.each do |shop|
      (10..18).each do |hour|
        amount = reservation(shop, date, hour)
        reservations.build(shop: shop, amount: amount, scheduled_datetime: date.to_time + hour.hours)
        sleep(0.2)
      end
    end
    save
  end

  def auto(date = Date.today, time = Time.current)
    hour = time.hour
    self.kind = :auto

    Shop.all.each do |shop|
      amount = reservation(shop, date, hour)
      reservations.build(shop: shop, amount: amount,  scheduled_datetime: date.to_time + hour.hours)
      sleep(0.2)
    end
    save
  end

  def self.batch
    e = new
    date = Date.today
    e.auto(date, date.to_time + Time.current.hour.hours + 1.hours)
  end

  def self.seed
    start_date = Date.today + 1
    end_date = start_date + 4
    hours = (10..18)
    (start_date..end_date).each do |date|
      hours.each do |hour|
        e = new
        e.auto(date, date.to_time + hour.hours)
      end
    end


  end

  private

  def reservation(shop, date, hour)
    uri      = URI.parse("https://epark.jp/receive/wait/reserve_minute_select_ajax/#{shop.cd}?reserve[receipt_date][date]=#{date.to_time.to_i}&reserve[receipt_date][hour]=#{hour}")
    response = Net::HTTP.get_response(uri)

    doc = Nokogiri::HTML.parse(response.body)

    doc.xpath('//select').xpath('//option').size - 1
  end
end
