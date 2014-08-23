module Ponytail
  class Cache
    attr_accessor :cache

    class << self
      def parse_json json
        new JSON.parse json
      end
    end

    def initialize(cache=nil)
      @cache = cache || {}
    end

    def as_json
      cache.as_json
    end

    def apply_table table
      if cache.key?(table.name) && cache[table.name].key?('name')
        table.name = cache[table.name]['name']
      end
    end

  end
end
