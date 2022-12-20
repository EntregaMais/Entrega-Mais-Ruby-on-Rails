require "rails_helper"

RSpec.describe PolisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/polis").to route_to("polis#index")
    end

    it "routes to #show" do
      expect(get: "/polis/1").to route_to("polis#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/polis").to route_to("polis#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/polis/1").to route_to("polis#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/polis/1").to route_to("polis#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/polis/1").to route_to("polis#destroy", id: "1")
    end
  end
end
