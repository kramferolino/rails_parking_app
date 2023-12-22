# seeds.rb

# Create entrances
entrances = [
  { name: "Entrance 1", location: "North Side" },
  { name: "Entrance 2", location: "South Side" },
  { name: "Entrance 3", location: "East Side" },
  # Add more entrances if needed
]

entrances.each do |entrance_params|
  entrance = Entrance.create!(entrance_params)

  # Create parking spaces associated with each entrance
  parking_spaces = [
    { parking_space_type: "SP", distance_to_entrance_1: 10, distance_to_entrance_2: 20, distance_to_entrance_3: 15, size_label: "Small" },
    { parking_space_type: "MP", distance_to_entrance_1: 15, distance_to_entrance_2: 25, distance_to_entrance_3: 20, size_label: "Medium" },
    { parking_space_type: "LP", distance_to_entrance_1: 20, distance_to_entrance_2: 30, distance_to_entrance_3: 25, size_label: "Large" },
    # Add more parking space records if needed
  ]

  parking_spaces.each do |parking_space_params|
    entrance.parking_spaces.create!(parking_space_params)
  end
end

# # Create a sample vehicle associated with a parking space
# # Replace the parking space ID with an existing ID from your ParkingSpace records
# ParkingSpace.find(1).vehicle.create!(
#   vehicle_type: "Small",
#   started_at: Time.now,
#   # Add more attributes if needed
# )
