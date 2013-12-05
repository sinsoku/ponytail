module Ponytail
  class Migration
    include ActiveModel::Model
    attr_accessor :name, :filename, :version, :raw_content

    class << self
      def check_pending?
        ActiveRecord::VERSION::MAJOR >= 4 && Rails.application.config.middleware.include?(ActiveRecord::Migration::CheckPending)
      end

      def all
        proxys = ActiveRecord::Migrator.migrations(migrations_paths)
        proxys.map { |p| new(name: p.name, filename: p.filename, version: p.version) }
      end
      delegate :migrations_paths, :migrations_path, :current_version, to: ActiveRecord::Migrator

      def migrate
        ActiveRecord::Migrator.migrate(migrations_paths)
      end

      def rollback
        ActiveRecord::Migrator.rollback(migrations_paths)
      end

      def next_version
        last = all.last
        ActiveRecord::Migration.next_migration_number(last ? last.version + 1 : 0).to_i
      end
    end

    def raw_content
      @raw_content ||= (filename != nil ? open(filename).read : nil)
    end

    def save
      if valid?
        next_migration_filename = "#{Migration.migrations_path}/#{Migration.next_version}_#{name.underscore}.rb"
        open(next_migration_filename, 'w').write(raw_content)
      else
        false
      end
    end
  end
end
