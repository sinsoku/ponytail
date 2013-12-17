module Ponytail
  class MigrationsController < ActionController::Base
    layout 'ponytail/application'

    def index
      @migrations = Migration.all
      @current_version = Migration.current_version
    end

    def new
      @migration = Migration.new
      @schema = Schema.new
    end

    def create
      @migration = Migration.new(migraion_params)

      if @migration.save
        redirect_to :migrations, notice: 'Migration was successfully created.'
      else
        @schema = Schema.new
        render action: :new
      end
    end

    def destroy
      # TODO: fix params[:id]
      @migration = Migration.all.select { |x| x.version == params[:id].to_i }.first
      @migration.destroy
      redirect_to :migrations, notice: 'Migration was successfully deleted.'
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
