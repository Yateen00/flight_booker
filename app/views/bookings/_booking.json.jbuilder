json.extract! booking, :id, :passenger_id, :flight_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
