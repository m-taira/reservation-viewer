class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :shop, foreign_key: true
      t.references :execution, foreign_key: true
      t.integer :amount
      t.datetime :scheduled_datetime

      t.timestamps
    end
  end
end
