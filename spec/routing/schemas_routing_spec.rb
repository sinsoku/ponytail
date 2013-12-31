require 'spec_helper'

describe Ponytail::SchemasController do
  it "routes to #update" do
    patch("/ponytail/schema").should route_to("ponytail/schemas#update")
  end
end
