class VehiclesController < ApplicationController
  # Render the form for entering vehicle information
  def new
    @vehicle = Vehicle.new
    @entrances = Entrance.all
  end

  # Process the form data and initiate parking
  def create
    @vehicle = Vehicle.new(vehicle_params)
    
    if @vehicle.save
      parking_space = ParkingSpace.find(params[:vehicle][:parking_space_id])
      parking_space.update(status: :occupied, vehicle: @vehicle)
      
      # Update the started_at time for the parked vehicle
      @vehicle.update(started_at: Time.current)
      
      redirect_to entrances_path, notice: 'Vehicle parked successfully!'
    else
      render :new
    end
  end
  

  # Display details of a parked vehicle
  def show
    @vehicle = Vehicle.find(params[:id])
    @parking_session = @vehicle.parking_sessions.last

    @distances = @vehicle.parking_session.parking_space.distances_from_entrances
  end

  # Process payment and end the parking session
  def unpark
    @vehicle = Vehicle.find(params[:id])
    parking_session = @vehicle.parking_sessions.last
  
    if parking_session
      unpark_result = ParkingSession.unpark(parking_session.id)
  
      # Payment processing (replace with your actual gateway integration)
      payment_successful = true  # Replace with payment gateway response
  
      if payment_successful
        # Record payment transaction
        payment_transaction = PaymentTransaction.create!(
          vehicle: parking_session.vehicle,
          total_payment: unpark_result[:fee],
          transaction_id: "simulated_transaction_id"  # Replace with actual transaction ID
        )
        flash[:notice] = 'Vehicle unparked successfully!'
        redirect_to entrances_path
      else
        flash[:error] = 'Payment failed. Please retry or contact support.'
        render :unpark  # Render the unpark view again to display error and allow retry
      end
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:vehicle_type, :parking_space_id, :entrance_id)
  end    
end