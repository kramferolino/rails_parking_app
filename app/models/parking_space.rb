class ParkingSpace < ApplicationRecord
  has_many :parking_sessions
  has_one :vehicle
  belongs_to :entrance

  validates :entrance, presence: true
  validates :size_label, presence: true

  COMPATIBILITY = {
    'small' => ['SP'],
    'medium' => ['MP'],
    'large' => ['LP']
    # Add more mappings if needed
  }

  def compatible_with?(vehicle_type)
    COMPATIBILITY[self.type].include?(vehicle.size_id)
  end

  def self.find_next_available(vehicle_type, entrance_id)
    puts "Searching for vehicle type: #{vehicle_type} at entrance ID: #{entrance_id}"
    available_space = where(
      status: "available",
      parking_space_type: COMPATIBILITY[vehicle_type], # Adjust to match the column name
      entrance_id: entrance_id
    ).first
    

    puts "Found space: #{available_space.inspect}"
    available_space
  end

  # Accessing distances as regular attributes
  def distances_from_entrances
    [
      [1, distance_to_entrance_1],
      [2, distance_to_entrance_2],
      [3, distance_to_entrance_3]  # ... (add other entrances)
    ]
  end

  def display_size
    size_label || "Unknown Size"
  end
end