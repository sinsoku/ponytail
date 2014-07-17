module Ponytail
  class MigrationsController < ActionController::Base
    layout 'ponytail/application'

    def index
      @schema = Schema.first
      @migrations = Migration.all
    end

    def new
      @migration = schema_change.to_migration
    end

    def create
      @migration = Migration.new(migraion_params)

      if @migration.save
        redirect_to ponytail_migrations_url, notice: 'Migration was successfully created.'
      else
        render action: 'new'
      end
    end

    def destroy
      @migration = Migration.find(params[:id])
      @migration.destroy
      redirect_to ponytail_migrations_url, notice: 'Migration was successfully deleted.'
    end

    private
    def migraion_params
      params.require(:ponytail_migration).permit(:name, :raw_content)
    end

    def schema_change
      @schema_change ||= SchemaChange.load(session[:schema_change])
    end
  end
end
