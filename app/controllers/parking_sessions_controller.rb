class ParkingSessionsController < ApplicationController
    require 'will_paginate/array'

    def index
        @parking_sessions = filter_parking_sessions(ParkingSession.all).paginate(page: params[:page], per_page: 10)
        render :index
    end
  
    def search
      query = params[:search_query]
      @parking_sessions = ParkingSession.where("your_search_logic_here", query)
      @parking_sessions = @parking_sessions.page(params[:page]).per(10) # Paginate search results
      render :index
    end

    def show
        @parking_session = ParkingSession.find(params[:id])
    end
      
  
    private
  
    def filter_parking_sessions(sessions)
      # Apply filters based on date range, vehicle type, entrance, etc.
      sessions = sessions.where(date: start_date..end_date) if params[:start_date].present? && params[:end_date].present?
      sessions = sessions.where(vehicle_type: params[:vehicle_type]) if params[:vehicle_type].present?
      sessions = sessions.where(entrance_id: params[:entrance_id]) if params[:entrance_id].present?
      sessions
    end
  end
  