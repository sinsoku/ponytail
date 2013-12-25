if Rails.env.production?
  module Ponytail
    class Migration
      def self.migrate
        false
      end

      def self.rollback
        false
      end

      def save
        valid?
      end

      def destroy
        false
      end
    end
  end
end
