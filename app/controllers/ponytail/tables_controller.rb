module Ponytail
  class TablesController < ActionController::Base
    layout 'ponytail/application'
    before_action :set_table, only: :show

    def index
      @tables = Table.all
    end

    def show
      @tables = Table.all
    end

    def update
    end

    def destroy
    end

    private
    def set_table
      @table = Table.find(params[:id])
      # if schema_change.tables.key? params[:id]
      #   @table ||= schema_change.tables[params[:id]]
      # else
      #   @table ||= Table.find(params[:id])
      # end
    end

    def schema_change
      @schema_change ||= SchemaChange.load(session[:schema_change])
    end
  end
end
