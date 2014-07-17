require 'spec_helper'

module Ponytail
  describe Table do
    describe 'include Dirty' do
      let(:table) { Table.new name: 'users' }
      before do
        table.reset_changes!
        table.name = "new_users"
      end

      it { expect(table).to be_changed }
      it { expect(table.changes[:name]).to eq ['users', 'new_users'] }
    end
  end
end
