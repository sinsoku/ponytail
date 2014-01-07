if Rails.env.production?
  module Ponytail
    class Migration
      def save
        valid?
      end

      def destroy
        false
      end
    end

    class Schema
      def update(attrs)
        true
      end
    end
  end
end
