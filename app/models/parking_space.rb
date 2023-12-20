class ParkingSpace < ApplicationRecord
  has_many :entrances, dependent: :destroy
  has_many :parking_slots, dependent: :destroy, counter_cache: true

  def adjust_slots(number_of_slots)
    current_slots = parking_slots.count
    number_of_slots = number_of_slots[:number_of_slots].to_i
    if number_of_slots > current_slots
      (number_of_slots - current_slots).times do
        parking_slots.create(size: 0)
      end
    elsif number_of_slots < current_slots
      parking_slots.order(created_at: :desc).limit(current_slots - number_of_slots).destroy_all
    end
  end
end
