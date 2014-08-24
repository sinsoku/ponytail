module Ponytail
  class TablesController < ActionController::Base
    layout 'ponytail/application'

    def index
      @tables = cache.apply_tables Table.all
    end

    def show
      @tables = cache.apply_tables Table.all
      @table = @tables.find { |t| t.name == params[:id] }
    end

    def update
    end

    def destroy
    end

    private
    def cache
      @cache ||= Cache.new session[:ponytail_cache]
    end
  end
end
