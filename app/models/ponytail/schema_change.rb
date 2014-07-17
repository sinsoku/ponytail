module Ponytail
  class SchemaChange
    attr_reader :tables

    class << self
      def load(obj)
        obj.nil? ? new : obj
      end
    end

    def initialize
      @tables ||= {}
    end

    def add_table(table)
      @tables[table.id] = table
    end

    def clear(table)
      @tables.delete(table.id)
    end

    def to_migration
      Migration.new
    end
  end
end
