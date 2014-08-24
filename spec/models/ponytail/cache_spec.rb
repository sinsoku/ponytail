require 'spec_helper'

module Ponytail
  describe Cache do
    describe '#initialize' do
      let(:session_cache) do
        {
          _ponytail: {
            version: 'v0.7.0',
          },
          users: {
            name: 'new_users',
          }
        }.to_json
      end
      let(:cache) { Cache.new session_cache }
      it { expect(cache.as_json).to include '_ponytail' => {'version' => 'v0.7.0'} }
      it { expect(cache.as_json).to include 'users' => {'name' => 'new_users'} }
    end

    describe '#apply_table' do
      let(:table) { Table.new name: 'users' }
      let(:cache) { Cache.new 'users' => {'name' => 'new_users'} }
      it do
        expect {
          cache.apply_table table
        }.to change(table, :name).from('users').to('new_users')
      end
    end
  end
end
