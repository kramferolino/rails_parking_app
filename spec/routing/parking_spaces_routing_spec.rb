require "rails_helper"

RSpec.describe ParkingSpacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/parking_spaces").to route_to("parking_spaces#index")
    end

    it "routes to #new" do
      expect(get: "/parking_spaces/new").to route_to("parking_spaces#new")
    end

    it "routes to #show" do
      expect(get: "/parking_spaces/1").to route_to("parking_spaces#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/parking_spaces/1/edit").to route_to("parking_spaces#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/parking_spaces").to route_to("parking_spaces#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/parking_spaces/1").to route_to("parking_spaces#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/parking_spaces/1").to route_to("parking_spaces#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/parking_spaces/1").to route_to("parking_spaces#destroy", id: "1")
    end
  end
end
