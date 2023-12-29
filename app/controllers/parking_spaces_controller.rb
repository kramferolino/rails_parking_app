class ParkingSpacesController < ApplicationController
  before_action :set_parking_space, only: %i[ show edit update destroy ]

  # GET /parking_spaces or /parking_spaces.json
  def index
    @parking_spaces = ParkingSpace.all
  end

  # GET /parking_spaces/1 or /parking_spaces/1.json
  def show
    @parking_space = ParkingSpace.find(params[:id])
    @vehicle = @parking_space.vehicle
  end

  # GET /parking_spaces/new
  def new
    @parking_space = ParkingSpace.new
  end

  # GET /parking_spaces/1/edit
  def edit
  end

  # POST /parking_spaces or /parking_spaces.json
  def create
    @parking_space = ParkingSpace.new(parking_space_params)

    respond_to do |format|
      if @parking_space.save
        format.html { redirect_to parking_space_url(@parking_space), notice: "Parking space was successfully created." }
        format.json { render :show, status: :created, location: @parking_space }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_spaces/1 or /parking_spaces/1.json
  def update
    respond_to do |format|
      if @parking_space.update(parking_space_params)
        format.html { redirect_to parking_space_url(@parking_space), notice: "Parking space was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_space }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_spaces/1 or /parking_spaces/1.json
  def destroy
    @parking_space.destroy!

    respond_to do |format|
      format.html { redirect_to parking_spaces_url, notice: "Parking space was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_space
      @parking_space = ParkingSpace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_space_params
      params.require(:parking_space).permit(:entrance_id, :space_size, :available)
    end
end