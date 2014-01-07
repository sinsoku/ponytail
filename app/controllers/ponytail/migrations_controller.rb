module Ponytail
  class MigrationsController < ActionController::Base
    layout 'ponytail/application'
    respond_to :html, only: [:index, :new]
    respond_to :json, only: [:create, :destroy]

    def index
      @migrations = Migration.all
    end

    def new
      @migration = Migration.new
      @schema = Schema.new
    end

    def create
      @migration = Migration.create(migraion_params)
      flash[:notice] = "Migration was successfully created."
      respond_with @migration
    end

    def destroy
      @migration = Migration.find(params[:id])
      if @migration
        @migration.destroy
        flash[:notice] = "Migration was successfully deleted."
        respond_with @migration
      else
        render nothing: true, status: 404
      end
    end

    private
    def migraion_params
      params.require(:ponytail_migration).permit(:name, :raw_content)
    end
  end
end
