require "rails_helper"

RSpec.describe ParkingSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/parking_sessions").to route_to("parking_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/parking_sessions/new").to route_to("parking_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/parking_sessions/1").to route_to("parking_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/parking_sessions/1/edit").to route_to("parking_sessions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/parking_sessions").to route_to("parking_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/parking_sessions/1").to route_to("parking_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/parking_sessions/1").to route_to("parking_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/parking_sessions/1").to route_to("parking_sessions#destroy", id: "1")
    end
  end
end
