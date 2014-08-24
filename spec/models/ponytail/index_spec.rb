require 'spec_helper'

module Ponytail
  describe Index do
    describe 'include Dirty' do
      let(:index) { Index.new name: 'index_users_on_name', columns: ['name'] }
      before { index.unique = true }

      it { expect(index).to be_changed }
      it { expect(index.changes[:unique]).to eq [nil, true] }
    end
  end
end
