module Ponytail
  class Table
    include ActiveModel::Model
    include ActiveModel::Dirty
    attr_accessor :name, :columns, :indexes
    define_attribute_methods :name
    alias :id :name

    validates :name, presence: true

    def name=(val)
      name_will_change! unless val == @name
      @name = val
    end

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
      @columns = params[:columns].map { |column| Column.from_colum(column) } if params[:columns]
      @indexes = params[:indexes].map { |index| Index.from_index(index) } if params[:indexes]
    end

    def reset_changes!
      @changed_attributes = {}
    end
  end
end
