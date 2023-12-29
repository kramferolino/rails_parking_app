class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to entrances_path, notice: "Vehicle parked successfully" }
        format.json { render :show, parked: :created, location: @vehicle }
      else
        format.html { render :new, parked: :unprocessable_entity }
        format.json { render json: @vehicle.errors, parked: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
        format.json { render :show, parked: :ok, location: @vehicle }
      else
        format.html { render :edit, parked: :unprocessable_entity }
        format.json { render json: @vehicle.errors, parked: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy!

    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def park
    @vehicle = Vehicle.new(vehicle_size: params[:vehicle][:vehicle_size])
    @parking_space = ParkingSpace.find_available(params[:vehicle][:vehicle_size]).first
    
    if @parking_space.present?
      @parking_space.update(vehicle: @vehicle, available: false)
      @vehicle.update(parked: true)
  
      redirect_to @parking_space, notice: "Vehicle parked successfully"
    else
      render :new, alert: "No available spaces"
    end
  end
  
  def unpark
    @vehicle = Vehicle.find(params[:vehicle_id])
    @parking_space = @vehicle.parking_space
    binding.pry
    if @parking_space.present?
      @parking_space.update(vehicle: nil, available: true)
      @vehicle.update(parked: false)
  
      redirect_to entrances_path, notice: "Vehicle unparked successfully" 
    else
      render :new, alert: "Vehicle not parked in a space"
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:vehicle_id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:vehicle_size, :parked)
    end
end