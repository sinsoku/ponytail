module Ponytail
  class SchemaController < ActionController::Base
    layout 'ponytail/application'

    def update
      @schema = Schema.new
      if @schema.update(schema_params)
        redirect_to ponytail_migrations_url, notice: 'Schema was successfully updated.'
      else
        redirect_to ponytail_migrations_url, notice: 'Schema update was failed.'
      end
    end

    private
    def schema_params
      params.require(:ponytail_schema).permit(:version)
    end
  end
end
