class ParkingSessionsController < ApplicationController
  before_action :set_parking_session, only: %i[ show edit update destroy ]

  # GET /parking_sessions or /parking_sessions.json
  def index
    @parking_sessions = ParkingSession.all
  end

  # GET /parking_sessions/1 or /parking_sessions/1.json
  def show
  end

  # GET /parking_sessions/new
  def new
    @parking_session = ParkingSession.new
  end

  # GET /parking_sessions/1/edit
  def edit
  end

  # POST /parking_sessions or /parking_sessions.json
  def create
    @parking_session = ParkingSession.new(parking_session_params)

    respond_to do |format|
      if @parking_session.save
        format.html { redirect_to parking_session_url(@parking_session), notice: "Parking session was successfully created." }
        format.json { render :show, status: :created, location: @parking_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_sessions/1 or /parking_sessions/1.json
  def update
    respond_to do |format|
      if @parking_session.update(parking_session_params)
        format.html { redirect_to parking_session_url(@parking_session), notice: "Parking session was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_sessions/1 or /parking_sessions/1.json
  def destroy
    @parking_session.destroy!

    respond_to do |format|
      format.html { redirect_to parking_sessions_url, notice: "Parking session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_session
      @parking_session = ParkingSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_session_params
      params.require(:parking_session).permit(:vehicle_id, :parking_space_id, :base_fee, :fee, :total_fee)
    end
end
