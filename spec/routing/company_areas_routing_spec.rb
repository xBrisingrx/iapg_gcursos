require "rails_helper"

RSpec.describe CompanyAreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/company_areas").to route_to("company_areas#index")
    end

    it "routes to #new" do
      expect(get: "/company_areas/new").to route_to("company_areas#new")
    end

    it "routes to #show" do
      expect(get: "/company_areas/1").to route_to("company_areas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/company_areas/1/edit").to route_to("company_areas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/company_areas").to route_to("company_areas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/company_areas/1").to route_to("company_areas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/company_areas/1").to route_to("company_areas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/company_areas/1").to route_to("company_areas#destroy", id: "1")
    end
  end
end
