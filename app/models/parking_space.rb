class ParkingSpace < ApplicationRecord
  belongs_to :entrance
  # has_one :vehicle

  belongs_to :vehicle, optional: true
  has_many :parking_sessions
  has_many :vehicles, through: :parking_sessions
  

  SIZE_OPTIONS = [["Small", 0], ["Medium", 1], ["Large", 2]]

  def size_label
    SIZE_OPTIONS.find { |size| size[1] == self.space_size }[0]  
  end

  def self.entrances
    Entrance.all
  end

  # def self.find_available(size)
  #   available_spaces = where(available: true)
  #                     .where("space_size >= ?", size)
  #   available_spaces.first  
  # end

  def self.find_available(size)
    case size.to_i
    when 0 # Small
      where(available: true)
        .where("space_size >= ?", 0)
        .order(space_size: :asc)
    when 1 # Medium
      where(available: true)
        .where("space_size >= ?", 1)
        .order(space_size: :asc)
    when 2 # Large
      where(available: true, space_size: 2)
    else
      none
    end
  end

  def self.park_vehicle(vehicle_size)
    available_space = find_available(vehicle_size).first

    if available_space.present?
      available_space.update(available: false)
      available_space
    else
      raise "Error: No available parking space for #{vehicle_size} vehicle"
    end
  end
end


