require 'spec_helper'

module Ponytail
  describe Schema do
    let(:schema) { Schema.new }
    let(:table_names) { [:users, :books] }

    before do
      ActiveRecord::Migrator.stub(current_version: '001')
    end

    describe "#initialize" do
      it { expect(schema.version).to eq '001' }
    end
  end
end
