module Ponytail
  class MigrationsController < ActionController::Base
    layout 'ponytail/application'

    def index
      @migrations = Migration.all
      @current_version = Migration.current_version
    end

    def new
      @migration = Migration.new
    end

    def create
      @migration = Migration.new(migraion_params)

      if @migration.save
        redirect_to :migrations, notice: 'Migration was successfully created.'
      else
        render action: 'new'
      end
    end

    def migrate
      if Migration.migrate
        redirect_to :migrations, notice: 'Migrate was succeed.'
      else
        redirect_to :migrations, notice: 'Migrate was failed.'
      end
    end

    def rollback
      if Migration.rollback
        redirect_to :migrations, notice: 'Rollback was succeed.'
      else
        redirect_to :migrations, notice: 'Rollback was failed.'
      end
    end

    private
    def migraion_params
      params.require(:ponytail_migration).permit(:name, :raw_content)
    end
  end
end
