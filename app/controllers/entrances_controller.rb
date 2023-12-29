class EntrancesController < ApplicationController
  before_action :set_entrance, only: %i[ show edit update destroy ]

  # GET /entrances or /entrances.json
  def index
    @entrances = Entrance.all
  end

  # GET /entrances/1 or /entrances/1.json
  def show
  end

  # GET /entrances/new
  def new
    @entrance = Entrance.new
  end

  # GET /entrances/1/edit
  def edit
  end

  # POST /entrances or /entrances.json
  def create
    @entrance = Entrance.new(entrance_params)

    respond_to do |format|
      if @entrance.save
        format.html { redirect_to entrance_url(@entrance), notice: "Entrance was successfully created." }
        format.json { render :show, status: :created, location: @entrance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrances/1 or /entrances/1.json
  def update
    respond_to do |format|
      if @entrance.update(entrance_params)
        format.html { redirect_to entrance_url(@entrance), notice: "Entrance was successfully updated." }
        format.json { render :show, status: :ok, location: @entrance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrances/1 or /entrances/1.json
  def destroy
    @entrance.destroy!

    respond_to do |format|
      format.html { redirect_to entrances_url, notice: "Entrance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrance
      @entrance = Entrance.find(params[:id])
      @entrance.parking_spaces.includes(:parking_session)
    end

    # Only allow a list of trusted parameters through.
    def entrance_params
      params.require(:entrance).permit(:name)
    end
end