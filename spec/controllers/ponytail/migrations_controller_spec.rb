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
          Migration.any_instance.stub(save: true)
          post :create, ponytail_migration: migration_attributes
        end
        it { expect(response).to redirect_to ponytail_migrations_url }
      end

      context "invalid params" do
        before do
          Migration.any_instance.stub(save: false)
          post :create, ponytail_migration: migration_attributes
        end
        it { expect(response).to render_template :new }
      end
    end

    describe "#destroy" do
      before do
        Migration.stub(find: Migration.new)
        Migration.any_instance.stub(:destroy)
        delete :destroy, id: "1"
      end
      it { expect(response).to redirect_to ponytail_migrations_url }
    end
  end
end
