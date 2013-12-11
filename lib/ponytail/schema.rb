module Ponytail
  class Schema
    def tables
      table_names.sort.map { |t| Table.new(t) }
    end

    private
    def table_names
      ActiveRecord::Base.connection.tables.delete_if { |t| t == 'schema_migrations' }
    end
  end

  class Table
    attr_reader :name
    def initialize(name=nil)
      @name = name
    end

    def columns
      @columns ||= ActiveRecord::Base.connection.columns(name)
    end

    def ==(other)
      name == other.name
    end
  end
end
