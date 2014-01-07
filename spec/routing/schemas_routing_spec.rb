require 'spec_helper'

describe Ponytail::SchemasController do
  it "routes to #show" do
    get("/ponytail/schema").should route_to("ponytail/schemas#show")
  end

  it "routes to #update" do
    patch("/ponytail/schema").should route_to("ponytail/schemas#update")
  end
end
