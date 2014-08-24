module Ponytail
  class Table
    include ActiveModel::Model
    include Dirty

    define_attribute_methods :name
    alias :id :name

    validates :name, presence: true

    class << self
      def schema
        Ponytail::Schema.first
      end

      def all
        schema.tables.map do |t|
          new(name: t[:name], columns: t[:columns], indexes: t[:indexes])
        end
      end

      def find(id)
        t = schema.tables.find { |x| x[:name] == id }
        new(name: t[:name], columns: t[:columns], indexes: t[:indexes])
      end
    end

    def initialize(params)
      super(params)
      @changed_attributes = {}
    end

    def columns
      @columns ||= ActiveRecord::Base.connection.columns(name).map do |attrs|
        Column.new attrs
      end
    end

    def indexes
      @indexes ||= ActiveRecord::Base.connection.indexes(name).map do |attrs|
        Index.new attrs
      end
    end
  end
end
