module Ponytail
  class Table
    include ActiveModel::Model
    include Dirty

    define_attribute_methods :name
    alias :id :name

    validates :name, presence: true

    class << self
      def all
        Schema.instance.table_names.map { |t| new name: t }
      end
    end

    def initialize(params)
      super(params)
      @changed_attributes = {}
    end

    def columns
      t = name_changed? ? name_was : name
      @columns ||= ActiveRecord::Base.connection.columns(t).map do |attrs|
        Column.new JSON.parse(attrs.to_json)
      end
    end

    def indexes
      t = name_changed? ? name_was : name
      @indexes ||= ActiveRecord::Base.connection.indexes(t).map do |attrs|
        Index.new attrs.to_h
      end
    end
  end
end
