module Ponytail
  class Column
    include ActiveModel::Model
    include Dirty

    define_attribute_methods :type, :name, :sql_type, :null, :limit, :precision,
      :scale, :default, :default_function, :primary, :coder

    validates :type, presence: true
    validates :name, presence: true

    def initialize(params)
      super(params)
      @changed_attributes = {}
    end
  end
end
