require 'spec_helper'

module Ponytail
  describe SchemaController, type: :controller do
    def schema_attributes
      {
        version: ''
      }
    end

    describe "#update" do
      context "valid params" do
        before do
          Schema.any_instance.stub(update: true)
          patch :update, ponytail_schema: schema_attributes
        end
        it { expect(response).to redirect_to(ponytail_migrations_url) }
        it { expect(flash[:notice]).to match(/successfully/) }
      end

      context "invalid params" do
        before do
          Schema.any_instance.stub(update: false)
          patch :update, ponytail_schema: schema_attributes
        end
        it { expect(response).to redirect_to(ponytail_migrations_url) }
        it { expect(flash[:notice]).to match(/failed/) }
      end
    end

  end
end
