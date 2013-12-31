require 'spec_helper'

module Ponytail
  describe MigrationsController do
    def migration_attributes
      {
        ponytail_migration: {}
      }
    end

    describe "#index.html" do
      before { get :index }
      it { expect(response).to be_success }
      it { expect(response.status).to eq(200) } # ok
    end

    describe "#new.html" do
      before { get :new }
      it { expect(response).to be_success }
      it { expect(response.status).to eq(200) } # ok
    end

    describe "#create.json" do
      context "valid params" do
        before do
          Migration.any_instance.stub(save: true)
          post :create, ponytail_migration: migration_attributes, format: :json
        end
        it { expect(response).to be_success }
        it { expect(response.status).to eq(201) } # created
      end

      context "invalid params" do
        before do
          Migration.any_instance.stub(valid?: false)
          Migration.any_instance.stub(errors: ['error'])
          post :create, ponytail_migration: migration_attributes, format: :json
        end
        it { expect(response).to be_client_error }
        it { expect(response.status).to eq(422) } # unprocessable entity
      end
    end

    describe "#destroy.json" do
      context "valid params" do
        before do
          Migration.any_instance.stub(destroy: true)
          Migration.stub(find: Migration.new)
          delete :destroy, id: "1", format: :json
        end
        it { expect(response).to be_success }
        it { expect(response.status).to eq(204) } # no content
      end

      context "invalid params" do
        before do
          Migration.any_instance.stub(destroy: false)
          delete :destroy, id: "invalid", format: :json
        end
        it { expect(response).to be_client_error }
        it { expect(response.status).to eq(404) } # not found
      end
    end
  end
end
