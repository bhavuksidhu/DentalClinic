require "rails_helper"

RSpec.describe StaffInfosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/staff_infos").to route_to("staff_infos#index")
    end

    it "routes to #new" do
      expect(get: "/staff_infos/new").to route_to("staff_infos#new")
    end

    it "routes to #show" do
      expect(get: "/staff_infos/1").to route_to("staff_infos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/staff_infos/1/edit").to route_to("staff_infos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/staff_infos").to route_to("staff_infos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/staff_infos/1").to route_to("staff_infos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/staff_infos/1").to route_to("staff_infos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/staff_infos/1").to route_to("staff_infos#destroy", id: "1")
    end
  end
end
