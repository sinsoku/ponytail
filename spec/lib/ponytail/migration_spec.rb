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

    describe ".next_version" do
      before do
        migration = Migration.new(version: 1)
        Migration.stub(all: [migration])
        ActiveRecord::Migration.should_receive(:next_migration_number)
        Migration.next_version
      end
      it "" do end
    end

    describe "#initialize" do
      subject { Migration.new(name: 'CreateUsers', filename: '001_create_users.rb', version: 1) }
      its(:name) { should eq 'CreateUsers' }
      its(:filename) { should eq '001_create_users.rb' }
      its(:version) { should eq 1 }
    end

    describe "#save" do
      context "migration is valid" do
        before do
          Migration.stub(migrations_path: 'db/migrate', next_version: '001')
          @migration = Migration.new(name: 'CreateBooks')
          @migration.stub(valid?: true)
          @migration.stub_chain(:open, :write)
          @migration.should_receive(:open).with('db/migrate/001_create_books.rb', 'w')
        end
        subject { @migration.save }
        it { should be_true }
      end
      context "migration is invalid" do
        before do
          @migration = Migration.new(name: 'CreateBooks')
          @migration.stub(valid?: false)
        end
        subject { @migration.save }
        it { should be_false }
      end
    end
  end
end
