module Ponytail
  class Schema
    def tables
      ActiveRecord::Base.connection.tables.sort.map { |t| Table.new(t) }
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
