require 'rails_helper'

RSpec.describe ParkingSpace, type: :model do
  describe '#adjust_slots' do
    let!(:parking_space) { create(:parking_space) } # Assuming you have a factory for ParkingSpace

    it 'increases the number of slots correctly' do
      current_slots = parking_space.parking_slots.count
      new_number_of_slots = current_slots + 5

      parking_space.adjust_slots({ number_of_slots: new_number_of_slots })

      expect(parking_space.parking_slots.count).to eq(new_number_of_slots)
    end

    it 'decreases the number of slots correctly' do
      current_slots = parking_space.parking_slots.count
      new_number_of_slots = current_slots - 3

      parking_space.adjust_slots({ number_of_slots: new_number_of_slots })

      expect(parking_space.parking_slots.count).to eq(new_number_of_slots)
    end

    it 'handles adjusting to the same number of slots' do
      current_slots = parking_space.parking_slots.count

      parking_space.adjust_slots({ number_of_slots: current_slots })

      expect(parking_space.parking_slots.count).to eq(current_slots)
    end
  end
end
