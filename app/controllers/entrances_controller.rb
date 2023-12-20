class EntrancesController < ApplicationController
    def new
        @entrance = Entrance.new
        @parking_spaces = ParkingSpace.all # Fetch all parking spaces for selection
    end
  
    def create
        @entrance = Entrance.new(entrance_params)
        if @entrance.save
            redirect_to @entrance.parking_space, notice: 'Entrance added successfully'
        else
            @parking_spaces = ParkingSpace.all
            flash.now[:alert] = 'Failed to create entrance. Please check the provided information.'
            render :new
        end
    end
  
    private
  
    def entrance_params
        params.require(:entrance).permit(:name, :location, :parking_space_id)
    end
end