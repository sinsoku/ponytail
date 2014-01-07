require 'spec_helper'

describe Ponytail::MigrationsController do
  it "routes to #index" do
    get("/ponytail/migrations").should route_to("ponytail/migrations#index")
  end

  it "routes to #new" do
    get("/ponytail/migrations/new").should route_to("ponytail/migrations#new")
  end

  it "routes to #create" do
    post("/ponytail/migrations").should route_to("ponytail/migrations#create")
  end

  it "routes to #destroy" do
    delete("/ponytail/migrations/1").should route_to("ponytail/migrations#destroy", id: "1")
  end
end
