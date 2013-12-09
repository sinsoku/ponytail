require 'spec_helper'

module Ponytail
  describe Schema do
    let(:schema) { Schema.new }
    let(:table_names) { [:users, :books] }
    before do
      ActiveRecord::Base.stub_chain(:connection, :tables).and_return(table_names)
    end
    it { expect(schema.tables).to include(Table.new(:users)) }
  end

  describe Table do
    describe "#columns" do
      let(:table) { Table.new }
      let(:expected_columns) { [] }
      before do
        ActiveRecord::Base.stub_chain(:connection, :columns).and_return(expected_columns)
      end
      it { expect(table.columns).to eq expected_columns }
    end
  end
end
