module Ponytail
  class Index
    include ActiveModel::Model
    include Dirty

    attr_accessor :table
    define_attribute_methods :name, :columns, :unique, :lengths, :orders,
      :where, :type, :using

    validates :name, presence: true
    validates :columns, presence: true

    def initialize(params)
      super(params)
      @changed_attributes = {}
    end
  end
end
