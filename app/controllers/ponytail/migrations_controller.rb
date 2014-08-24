module Ponytail
  class MigrationsController < ActionController::Base
    layout 'ponytail/application'
    before_action :set_migration, only: :new

    def index
      @schema = Schema.instance
      @migrations = Migration.all
    end

    def new
    end

    def create
      @migration = Migration.new(migraion_params)

      if @migration.save
        session.delete :ponytail_cache
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

    def set_migration
      @migration ||= cache.to_migration
    end

    def cache
      @cache ||= Cache.new session[:ponytail_cache]
    end
  end
end
