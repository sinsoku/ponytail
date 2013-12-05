require 'spec_helper'

module Ponytail
  describe Migration do
    describe ".all" do
      before do
        proxy = Struct.new(:proxy, :name, :filename, :version)
        ActiveRecord::Migrator.stub(migrations: [proxy.new('CreateUsers', '001_create_users', 1)])
      end
      subject { Migration.all }
      its(:first) { should be_a_kind_of Migration }
    end

    describe "#initialize" do
      subject { Migration.new(name: 'CreateUsers', filename: '001_create_users.rb', version: 1) }
      its(:name) { should eq 'CreateUsers' }
      its(:filename) { should eq '001_create_users.rb' }
      its(:version) { should eq 1 }
    end
  end
end
