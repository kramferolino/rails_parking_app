class ParkingSlot < ApplicationRecord
    belongs_to :parking_space
    belongs_to :entrance, optional: true
    belongs_to :vehicle, optional: true
    attribute :size, :integer, default: 0
    enum size: { small: 0, medium: 1, large: 2 }
  
    # Update scope to consider both no vehicle and specific size
    scope :available, ->(size) { where(vehicle_id: nil, size: sizes[size]) }
end