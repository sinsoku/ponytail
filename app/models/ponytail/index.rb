module Ponytail
  class Index
    include ActiveModel::Model
    include ActiveModel::Dirty

    model_attributes = :name, :columns, :unique, :lengths, :orders, :where,
      :type, :using
    define_attribute_methods(*model_attributes)
    alias :id :name

    validates :name, presence: true
    validates :columns, presence: true

    model_attributes.each do |m|
      class_eval <<-EOS
        def #{m}
          @#{m}
        end
        def #{m}=(val)
          #{m}_will_change! unless val == @#{m}
          @#{m} = val
        end
      EOS
    end

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
