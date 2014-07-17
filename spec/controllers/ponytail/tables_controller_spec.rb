require 'spec_helper'

module Ponytail
  describe TablesController, type: :controller do
    describe "#index" do
      before { get :index }
      it { expect(response).to be_success }
    end

    describe "#show" do
      # FIXME
      # before do
      #   Table.stub(find: Table.new)
      #   get :show, id: "users"
      # end
      # it { expect(response).to be_success }
    end
  end
end
