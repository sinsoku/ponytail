module Ponytail
  class Cache
    attr_accessor :cache

    def initialize(cache=nil)
      if cache.nil?
        @cache = {}
      elsif cache.is_a? String
        @cache = JSON.parse cache
      else
        @cache = cache
      end
    end

    def as_json
      cache.as_json
    end

    def apply_tables tables
      tables.map { |t| apply_table t }
    end

    def apply_table table
      if cache.key?(table.name) && cache[table.name].key?('name')
        table.name = cache[table.name]['name']
      end
      table
    end

    def to_migration
      Migration.new name: 'NewMigration', raw_content: raw_content
    end

    def raw_content
      ''
    end
  end
end
