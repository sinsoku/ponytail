require 'ponytail/dirty'

module Ponytail
  module Dirty
    extend ActiveSupport::Concern
    include ActiveModel::Dirty

    module ClassMethods
      def define_attribute_method_with_auto_generate(attr_name)
        define_attribute_method_without_auto_generate attr_name
        class_eval <<-EOS
          def #{attr_name}
            @#{attr_name}
          end
          def #{attr_name}=(val)
            #{attr_name}_will_change! unless val == @#{attr_name}
            @#{attr_name} = val
          end
        EOS
      end
    end

    included do
      class << self
        alias_method_chain :define_attribute_method, :auto_generate
      end
    end
  end
end
