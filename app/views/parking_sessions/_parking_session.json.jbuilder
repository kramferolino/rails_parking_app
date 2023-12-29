json.extract! parking_session, :id, :vehicle_id, :parking_space_id, :base_fee, :fee, :total_fee, :created_at, :updated_at
json.url parking_session_url(parking_session, format: :json)
