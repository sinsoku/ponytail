require 'spec_helper'

module Ponytail
  describe Column do
    describe 'include Dirty' do
      let(:column) { Column.new name: 'Fate Testarossa', type: :string }
      before { column.name = 'Fate T.Harlaown' }

      it { expect(column).to be_changed }
      it { expect(column.changes[:name]).to eq ['Fate Testarossa', 'Fate T.Harlaown'] }
    end
  end
end
