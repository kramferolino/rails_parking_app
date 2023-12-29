class ParkingSession < ApplicationRecord
  belongs_to :vehicle
  belongs_to :parking_space
  # has_one :vehicle, through: :parking_space
  before_validation :set_estimated_end_time

  def set_estimated_end_time
    if fee_estimated
      self.end_at = Time.now 
    else
      self.end_at = parking_session.end_at
    end
  end

  def calculate_fee(parking_session)
    hours = set_estimated_end_time - parking_session.start_at
    hours /= 1.hour
  
    parking_space_size_int = parking_session.parking_space.space_size
    hourly_rate = get_hourly_rate(parking_space_size_int, parking_session.vehicle.size)
  
    fee = base_fee
  
    if hours > 3
      excess_hours = hours - 3
      fee += excess_hours * hourly_rate
    end
  
    if hours > 24
      full_days = hours / 24 
      fee += full_days * 5000
  
      remaining_hours = hours % 24
      fee += remaining_hours * hourly_rate
    end
  
    parking_session.update(
      base_fee: base_fee, 
      fee: fee,
      total_fee: fee
    )
  end
  
  
  def get_hourly_rate(parking_space_size_int, vehicle_size)
    case parking_space_size_int
      when ParkingSpace::SIZE_OPTIONS[0][1] then 20 # Small
      when ParkingSpace::SIZE_OPTIONS[1][1] then 80 # Medium
      when ParkingSpace::SIZE_OPTIONS[2][1] then 100 # Large 
    end
  end  
end
