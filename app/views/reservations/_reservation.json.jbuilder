json.extract! reservation, :id, :shop_id, :execution_id, :amount, :scheduled_datetime, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)