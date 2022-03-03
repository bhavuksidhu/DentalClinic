require "rails_helper"

RSpec.describe TreatmentCoordinatorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/treatment_coordinators").to route_to("treatment_coordinators#index")
    end

    it "routes to #new" do
      expect(get: "/treatment_coordinators/new").to route_to("treatment_coordinators#new")
    end

    it "routes to #show" do
      expect(get: "/treatment_coordinators/1").to route_to("treatment_coordinators#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/treatment_coordinators/1/edit").to route_to("treatment_coordinators#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/treatment_coordinators").to route_to("treatment_coordinators#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/treatment_coordinators/1").to route_to("treatment_coordinators#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/treatment_coordinators/1").to route_to("treatment_coordinators#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/treatment_coordinators/1").to route_to("treatment_coordinators#destroy", id: "1")
    end
  end
end
