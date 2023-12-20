class ParkingController < ApplicationController
    SLOT_SIZES = { SP: :small, MP: :medium, LP: :large }.freeze
    BASE_RATE = 40
    EXCEEDING_RATES = { SP: 20, MP: 60, LP: 100 }.freeze
    FULL_DAY_FEE = 5000

    def assign_slot(vehicle)
        available_slots = vehicle.available_parking_slots
        vehicle_size = vehicle.size.to_sym
    
        available_slots.each do |slot|
          slot_size = slot.size.to_sym
          return slot if can_park_in_slot?(vehicle_size, slot_size)
        end
    
        nil
      end
    
    def can_park_in_slot?(vehicle_size, slot_size)
        case vehicle_size
            when :small
                return true if %i[SP MP LP].include?(slot_size)
            when :medium
                return true if %i[MP LP].include?(slot_size)
            when :large
                return true if slot_size == :LP
        end
        false
    end

    def calculate_fee(parked_time, slot_size)
        base_fee = BASE_RATE * [parked_time, 3].min
        exceeding_hours = [parked_time - 3, 0].max
        exceeding_fee = exceeding_hours * EXCEEDING_RATES[slot_size]
    
        total_fee = base_fee + exceeding_fee
        total_fee += FULL_DAY_FEE * (parked_time / 24).floor if parked_time >= 24
    
        total_fee.ceil
    end
  
  
    def park(vehicle)
        slot = assign_slot(vehicle)
        if slot.present?
            vehicle.update(parking_slot: slot)
            { confirmation: 'Successfully parked', slot: slot.id }
        else
            { error: 'No available slots' }
        end
      end
  
      def unpark(vehicle)
        if vehicle.parking_slot.present?
            parked_time = calculate_parked_time(vehicle)
            if parked_time.nil?
                { error: 'Error calculating parked time' }
            else
                slot_size = SLOT_SIZES[vehicle.parking_slot.size.to_sym]
                fee = calculate_fee(parked_time, slot_size)
                vehicle.update(parking_slot: nil)
                { confirmation: 'Successfully exited', fee: fee }
            end
        else
            { error: 'Vehicle is not parked' }
        end
      end
  
    private
  
    def calculate_parked_time(vehicle)
        parked_time = (Time.now - vehicle.parking_slot.created_at) / 3600 rescue nil # Convert to hours
    end
end