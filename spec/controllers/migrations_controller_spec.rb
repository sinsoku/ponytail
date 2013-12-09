require 'spec_helper'

module Ponytail
  describe MigrationsController do
    let(:controller) { MigrationsController.new }

    describe "#index" do
      before do
        Migration.stub(:all)
        Migration.stub(:current_version)
        controller.index
      end
      it { expect(controller).to be_instance_variable_defined(:@migrations) }
      it { expect(controller).to be_instance_variable_defined(:@current_version) }
    end

    describe "#new" do
       before do
         Migration.stub(:new)
         controller.new
       end
       it { expect(controller).to be_instance_variable_defined(:@migration) }
    end

    describe "#create" do
      context "save was succeed." do
        before do
          @migration = Migration.new
          @migration.stub(save: true)
          Migration.stub(new: @migration)
          controller.stub(migraion_params: {})
          controller.should_receive(:redirect_to).with(:migrations, notice: 'Migration was successfully created.')
          controller.create
        end
        it "redirect to migrations, and notice" do end
        it { expect(controller).to be_instance_variable_defined(:@migration) }
      end
      context "save was failed." do
        before do
          @migration = Migration.new
          @migration.stub(save: false)
          Migration.stub(new: @migration)
          controller.stub(migraion_params: {})
          controller.should_receive(:render).with(action: :new)
          controller.create
        end
        it "redirect to migrations, and notice" do end
        it { expect(controller).to be_instance_variable_defined(:@migration) }
      end
    end

    describe "#migrate" do
      context "migrate was succeed." do
        before do
          Migration.stub(migrate: true)
          controller.should_receive(:redirect_to).with(:migrations, notice: 'Migrate was succeed.')
          controller.migrate
        end
        it "redirect to migrations, and notice" do end
      end

      context "migrate was failed." do
        before do
          Migration.stub(migrate: false)
          controller.should_receive(:redirect_to).with(:migrations, notice: 'Migrate was failed.')
          controller.migrate
        end
        it "redirect to migrations, and notice" do end
      end
    end

    describe "#rollback" do
      context "rollback was succeed." do
        before do
          Migration.stub(rollback: true)
          controller.should_receive(:redirect_to).with(:migrations, notice: 'Rollback was succeed.')
          controller.rollback
        end
        it "redirect to migrations, and notice" do end
      end

      context "rollback was failed." do
        before do
          Migration.stub(rollback: false)
          controller.should_receive(:redirect_to).with(:migrations, notice: 'Rollback was failed.')
          controller.rollback
        end
        it "redirect to migrations, and notice" do end
      end
    end
  end
end
