require "rails_helper"

RSpec.describe TrajetosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/trajetos").to route_to("trajetos#index")
    end

    it "routes to #show" do
      expect(get: "/trajetos/1").to route_to("trajetos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/trajetos").to route_to("trajetos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/trajetos/1").to route_to("trajetos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/trajetos/1").to route_to("trajetos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/trajetos/1").to route_to("trajetos#destroy", id: "1")
    end
  end
end
