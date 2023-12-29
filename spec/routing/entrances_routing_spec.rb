require "rails_helper"

RSpec.describe EntrancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/entrances").to route_to("entrances#index")
    end

    it "routes to #new" do
      expect(get: "/entrances/new").to route_to("entrances#new")
    end

    it "routes to #show" do
      expect(get: "/entrances/1").to route_to("entrances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/entrances/1/edit").to route_to("entrances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/entrances").to route_to("entrances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/entrances/1").to route_to("entrances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/entrances/1").to route_to("entrances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/entrances/1").to route_to("entrances#destroy", id: "1")
    end
  end
end
