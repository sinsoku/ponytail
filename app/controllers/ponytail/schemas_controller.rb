module Ponytail
  class SchemasController < ActionController::Base
    respond_to :json, only: [:show, :update]

    def show
      @schema = Schema.new
      respond_with @schema
    end

    def update
      # TODO, WIP:
      @schema = Schema.new
      if @schema.update(schema_params)
        render json: @schema, status: :ok
      else
        render json: @schema, status: :bad_request
      end
    end

    private
    def schema_params
      params.require(:ponytail_schema).permit(:version)
    end
  end
end
