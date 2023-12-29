json.extract! vehicle, :id, :vehicle_size, :status, :start_at, :end_at, :duration, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
