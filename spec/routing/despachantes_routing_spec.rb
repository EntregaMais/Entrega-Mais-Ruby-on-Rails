require "rails_helper"

RSpec.describe DespachantesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/despachantes").to route_to("despachantes#index")
    end

    it "routes to #show" do
      expect(get: "/despachantes/1").to route_to("despachantes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/despachantes").to route_to("despachantes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/despachantes/1").to route_to("despachantes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/despachantes/1").to route_to("despachantes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/despachantes/1").to route_to("despachantes#destroy", id: "1")
    end
  end
end
