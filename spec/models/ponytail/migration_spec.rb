require 'spec_helper'

module Ponytail
  describe Migration do
    describe ".all" do
      before do
        proxy = Struct.new(:proxy, :name, :filename, :version)
        allow(ActiveRecord::Migrator).to receive(:migrations) { [proxy.new('CreateUsers', '001_create_users', 1)] }
      end
      subject { Migration.all }
      it { expect(subject.first).to be_a_kind_of Migration }
    end

    describe ".next_version" do
      before do
        migration = Migration.new(version: 1)
        allow(Migration).to receive(:all) { [migration] }
        expect(ActiveRecord::Migration).to receive(:next_migration_number)
        Migration.next_version
      end
      it "" do end
    end

    describe "#initialize" do
      subject { Migration.new(name: 'CreateUsers', filename: '001_create_users.rb', version: 1) }
      it { expect(subject.name).to eq 'CreateUsers' }
      it { expect(subject.filename).to eq '001_create_users.rb' }
      it { expect(subject.version).to eq 1 }
    end

    describe "#save" do
      context "migration is valid" do
        before do
          allow(Migration).to receive(:migrations_path) { 'db/migrate' }
          allow(Migration).to receive(:next_version) { '001' }
          @migration = Migration.new(name: 'CreateBooks')
          @migration.stub(valid?: true)
          @migration.stub_chain(:open, :write)
          @migration.should_receive(:open).with('db/migrate/001_create_books.rb', 'w')
        end
        subject { @migration.save }
        # FIXME
        # it { should be_true }
      end
      context "migration is invalid" do
        before do
          @migration = Migration.new(name: 'CreateBooks')
          allow(@migration).to receive(:valid?) { false }
        end
        subject { @migration.save }
        # FIXME
        # it { should be_false }
      end
    end
  end
end
