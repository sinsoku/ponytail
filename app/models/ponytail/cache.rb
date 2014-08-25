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
      ['class NewMigration < ActiveRecord::Migration',
       indent('def change', 1),
       create_tables.map { |c| indent(c, 2) }.join("\n"),
       rename_tables.map { |c| indent(c, 2) }.join("\n"),
       add_columns.map { |c| indent(c, 2) }.join("\n"),
       indent('end', 1),
       'end',
      ].reject { |c| c.empty? }.join("\n")
    end

    def create_tables
      if @cache.key? '_new'
        @cache['_new'].map do |k, v|
          l = ["create_table #{k} do |t|"]
          l += v['columns'].map { |c| "  t.#{c['type']} :#{c['name']}" }
          l << ''
          l << '  t.timestamps'
          l << 'end'
          l.join("\n")
        end
      else
        []
      end
    end

    def rename_tables
      @cache.reject { |k, v| ['_new', '_ponytail'].include? k }
        .map do |k, v|
          if v.key? 'name'
            "rename_table :#{k}, :#{v['name']}"
          else
            ''
          end
        end
    end

    def add_columns
      @cache.reject { |k, v| ['_new', '_ponytail'].include? k }
        .map do |k, v|
          if v.key? '_columns'
            v['_columns'].map do |c|
              "add_column :#{k}, :#{c['name']}, :#{c['type']}"
            end.join("\n")
          else
            ''
          end
        end
    end

    def indent(str, n)
      str.gsub(/^/, '  '*n)
    end
  end
end
