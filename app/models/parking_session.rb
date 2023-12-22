class ParkingSession < ApplicationRecord
  # Attributes:
  belongs_to :vehicle
  belongs_to :entrance
  belongs_to :parking_space, optional: true # Optional for pre-assigned spaces
  has_many :payment_transactions

  # Fee calculation:
  def calculate_fee
    duration = (self.end_at - self.started_at) / 3600  # Use 'self' to refer to the instance attributes
    rounded_duration = duration.ceil  # Round up for billing

    base_rate = 40  # Base rate for first 3 hours
    hourly_rates = { "SP" => 20, "MP" => 60, "LP" => 100 }  # Hourly rates by slot type
    long_term_rate = 5000  # 24-hour chunk rate

    fee = if rounded_duration <= 3
            base_rate  # Base rate for first 3 hours
          elsif rounded_duration <= 24
            base_rate + (rounded_duration - 3) * hourly_rates[self.parking_space.type]  # Use 'self' for parking_space
          else
            (rounded_duration / 24).ceil * long_term_rate +  # 24-hour chunks
              (rounded_duration % 24) * hourly_rates[self.parking_space.type]  # Remainder hours
          end

    # Re-entry within 1 hour (continuous rate)
    if previous_session = self.vehicle.parking_sessions.last
      if previous_session.end_at >= 1.hour.ago && previous_session != self
        fee = previous_session.calculate_fee + base_rate  # Charge base rate for continuous session
      end
    end

    fee
  end

  def park(vehicle_type, entrance_id)
    available_space = ParkingSpace.find_next_available(vehicle_type, entrance_id)

    if available_space
      parking_session = ParkingSession.transaction do
        parking_session = create(vehicle: vehicle, entrance: entrance, parking_space: available_space)
        available_space.update!(status: "occupied")
        parking_session
      end
      parking_session
    else
      # raise ParkingError, "No compatible parking space available for this vehicle type at the specified entrance."
    end
  end

  def unpark(parking_session_id)
    parking_session = ParkingSession.find(parking_session_id)
    parking_space = parking_session.parking_space

    fee = parking_session.calculate_fee
    parking_session.update!(end_at: Time.now)

    parking_space.update!(status: "available")

    payment_transaction = create(vehicle: parking_session.vehicle, total_payment: fee, parking_session: parking_session)

    { parking_space_id: parking_space.id, fee: fee }
  end
end