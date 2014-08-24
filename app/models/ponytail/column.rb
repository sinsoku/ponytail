require 'ponytail/dirty'

module Ponytail
  class Column
    include ActiveModel::Model
    include Dirty

    define_attribute_methods :type, :name, :sql_type, :null, :limit, :precision,
      :scale, :default, :default_function, :primary, :coder
    alias :id :name

    validates :type, presence: true
    validates :name, presence: true

    class << self
      def from_colum(column)
        obj = new type: column.type,
          name: column.name,
          sql_type: column.sql_type,
          null: column.null,
          limit: column.limit,
          precision: column.precision,
          scale: column.scale,
          default: column.default,
          default_function: column.default_function,
          primary: column.primary,
          coder: column.coder
        obj.reset_changes!
        obj
      end
    end

    def reset_changes!
      @changed_attributes = {}
    end
  end
end
