class EntrancesController < ApplicationController
    # List all entrances
    def index
      @entrances = Entrance.includes(parking_spaces: [:vehicle]).all
    end    
  
    # Display details of a specific entrance
    def show
      @entrance = Entrance.find(params[:id])
    end
  end