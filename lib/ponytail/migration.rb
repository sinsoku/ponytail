module Ponytail
  class Migration
    include ActiveModel::Model
    attr_accessor :name, :filename, :version, :raw_content

    validates :name, presence: true
    validates :raw_content, presence: true

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

      def create(attrs)
        migration = new(attrs)
        migration.save
        migration
      end

      def find(id)
        all.select { |x| x.version == id }.first
      end
    end

    def filename_only
      # TODO, WIP:
      filename.sub("#{Ponytail::Migration.migrations_path}/", "")
    end

    def raw_content
      @raw_content ||= (filename != nil ? open(filename).read : nil)
    end

    def save
      if valid?
        next_filename = "#{Migration.migrations_path}/#{Migration.next_version}_#{name.underscore}.rb"
        open(next_filename, 'w') { |f| f.write(raw_content) }
        true
      else
        false
      end
    end

    def destroy
      File.delete(filename)
    end

    def current?
      version == Migration.current_version
    end

    def as_json(attrs)
      {
        name: name,
        filename: filename,
        version: version,
        raw_content: raw_content
      }
    end
  end
end
