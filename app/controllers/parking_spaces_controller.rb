class ParkingSpacesController < ApplicationController
    before_action :set_entrance
    before_action :set_parking_space, only: [:show, :edit, :update, :destroy]
    
    private
    def set_entrance
        @entrance = Entrance.find(params[:entrance_id])
    end
  
    def set_parking_space
        @parking_space = @entrance.parking_spaces.find(params[:id])
        @vehicle = @parking_space.vehicle if @parking_space.present?
      end
      
  
    def parking_space_params
        params.require(:parking_space).permit(:parking_space_type, :status, :distance_to_entrance_1, :distance_to_entrance_2, :distance_to_entrance_3, :size_label)
    end
end
  