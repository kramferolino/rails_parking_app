class ParkingSpacesController < ApplicationController
    def index
        @parking_spaces = ParkingSpace.includes(parking_slots: :vehicle).all
    end
      
    def edit_slots
        @parking_space = ParkingSpace.find(params[:id])
    end
  
    def update_slots
        @parking_space = ParkingSpace.find(params[:id])
        if @parking_space.update(parking_space_params)
          @parking_space.adjust_slots(params[:parking_space][:number_of_slots].to_i)
          redirect_to @parking_space, notice: 'Parking slots updated successfully'
        else
          render :edit_slots
        end
      end
  
    def park_manually(vehicle, size, slot_id)
        slot = ParkingSlot.find(slot_id)
        vehicle.size = size
    
        if slot.present? && vehicle.valid? && vehicle.save
          if slot.update(vehicle_id: vehicle.id, size: vehicle.size)
            { confirmation: 'Successfully parked manually', slot: slot.id }
          else
            { error: 'Failed to manually park the vehicle' }
          end
        else
          { error: 'Failed to manually park the vehicle: Invalid size or attributes' }
        end
      end
  
    def unpark_and_view_fee
        vehicle = Vehicle.find_by(id: params[:vehicle_id])
        if vehicle.present? && vehicle.parking_slot.present?
            parked_time = calculate_parked_time(vehicle)
            if parked_time.nil?
                return { error: 'Error calculating parked time' }
            else
                fee = calculate_fee(vehicle, parked_time)
                return { vehicle: vehicle, fee: fee }
            end
        else
            return { error: 'Vehicle is not parked' }
        end
    end
    
    def delete_vehicle
        vehicle = Vehicle.find_by(id: params[:vehicle_id])
        if vehicle.present? && vehicle.parking_slot.present?
            if vehicle.update(parking_slot: nil)
                return { confirmation: 'Successfully exited' }
            else
                return { error: 'Failed to exit the vehicle' }
            end
        else
            return { error: 'Vehicle is not parked' }
        end
    end

    def new_manual_parking
        @slot_id = params[:id]
        @vehicle = Vehicle.new
    end
  
    def create_manual_parking
        puts "Received parameters: #{params.inspect}"
        vehicle = Vehicle.new(vehicle_params)
        slot_id = params.dig(:vehicle, :slot_id)
        vehicle.parking_slot_id = slot_id
    
        if vehicle.save
            result = park_manually(vehicle, vehicle.size, slot_id)
            if result[:confirmation]
                redirect_to root_path, notice: result[:confirmation]
            else
                flash.now[:alert] = result[:error]
                render :new_manual_parking
            end
        else
            flash.now[:alert] = 'Failed to create a vehicle'
            render :new_manual_parking
        end
    end

    private
  
    def vehicle_params
        params.require(:vehicle).permit(:size, :slot_id)
    end
    
    def calculate_parked_time(vehicle)
        parked_time = (Time.now - vehicle.parking_slot.created_at) / 3600 rescue nil # Convert to hours
    end

    def calculate_fee(vehicle, parked_time)
        base_rate = 40
        exceeding_rates = { small: 20, medium: 60, large: 100 }
        size_sym = vehicle&.size&.to_sym || :small
        exceeding_hours = [parked_time - 3, 0].max
        base_fee = base_rate * [parked_time, 3].min
        exceeding_fee = exceeding_hours * exceeding_rates[size_sym]
        total_fee = base_fee + exceeding_fee
      
        if parked_time >= 24
            total_fee = ((parked_time / 24).floor * 5000) + (total_fee % 5000)
        end
      
        total_fee.ceil
    end

    def parking_space_params
        params.require(:parking_space).permit(:number_of_slots)
    end
end