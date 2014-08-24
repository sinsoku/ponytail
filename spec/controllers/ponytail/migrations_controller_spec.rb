require 'spec_helper'

module Ponytail
  describe MigrationsController, type: :controller do
    def migration_attributes
      {
        name: '',
        raw_content: ''
      }
    end

    describe "#index" do
      before { get :index }
      it { expect(response).to be_success }
    end

    describe "#new" do
      before { get :new }
      it { expect(response).to be_success }
    end

    describe "#create" do
      context "valid params" do
        before do
          allow_any_instance_of(Migration).to receive(:save) { true }
          post :create, ponytail_migration: migration_attributes
        end
        it { expect(response).to redirect_to ponytail_migrations_url }
      end

      context "invalid params" do
        before do
          allow_any_instance_of(Migration).to receive(:save) { false }
          post :create, ponytail_migration: migration_attributes
        end
        it { expect(response).to render_template :new }
      end
    end

    describe "#destroy" do
      before do
        allow(Migration).to receive(:find) { Migration.new }
        allow_any_instance_of(Migration).to receive(:destroy)
        delete :destroy, id: "1"
      end
      it { expect(response).to redirect_to ponytail_migrations_url }
    end
  end
end
