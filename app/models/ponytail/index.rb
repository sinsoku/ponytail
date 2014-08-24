require 'ponytail/dirty'

module Ponytail
  class Index
    include ActiveModel::Model
    include Dirty

    define_attribute_methods :name, :columns, :unique, :lengths, :orders,
      :where, :type, :using
    alias :id :name

    validates :name, presence: true
    validates :columns, presence: true

    class << self
      def from_index(index)
        obj = new name: index.name,
          columns: index.columns,
          unique: index.unique,
          lengths: index.lengths,
          orders: index.orders,
          where: index.where,
          type: index.type,
          using: index.using
        obj.reset_changes!
        obj
      end
    end

    def reset_changes!
      @changed_attributes = {}
    end

  end
end
