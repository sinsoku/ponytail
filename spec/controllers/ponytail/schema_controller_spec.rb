require 'spec_helper'

module Ponytail
  describe SchemaController do
    def schema_attributes
      {
        ponytail_schema: {}
      }
    end

    describe "#show.json" do
      before do
        get :show, format: :json
      end
      it { expect(response).to be_success }
      it { expect(response.status).to eq(200) } # ok
    end

    describe "#update.json" do

      context "valid params" do
        before do
          Schema.any_instance.stub(update: true)
          patch :update, ponytail_schema: schema_attributes, format: :json
        end
        it { expect(response).to be_success }
        it { expect(response.status).to eq(200) } # ok
      end

      context "invalid params" do
        before do
          Schema.any_instance.stub(update: false)
          patch :update, ponytail_schema: schema_attributes, format: :json
        end
        it { expect(response).to be_client_error }
        it { expect(response.status).to eq(400) } # bad request
      end
    end
  end
end
