module Ponytail
  class Migration
    include ActiveModel::Model
    attr_accessor :name, :filename, :version, :raw_content, :status
    alias :id :name

    validates :name, presence: true
    validates :raw_content, presence: true

    class << self
      def all
        db_list = ActiveRecord::Base.connection.select_values("SELECT version FROM #{ActiveRecord::Migrator.schema_migrations_table_name}")
        proxys = ActiveRecord::Migrator.migrations(migrations_paths)
        proxys.map do |p|
          status = db_list.delete(p.version.to_s) ? 'up' : 'down'
          new(name: p.name, filename: p.filename, version: p.version, status: status)
        end
      end
      delegate :migrations_paths, :migrations_path, :current_version, to: ActiveRecord::Migrator

      def next_version
        last = all.last
        ActiveRecord::Migration.next_migration_number(last ? last.version + 1 : 0).to_i
      end

      def find(version)
        all.find { |x| x.version == version.to_i }
      end

      def load(migration)
        migration.nil? ? new : migration
      end
    end

    def persisted?
      filename.present?
    end

    def description
      # TODO
      if match_data = /(\d{3,})_(.+)\.rb$/.match(filename)
        match_data[2].humanize
      else
        '********** NO FILE **********'
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
      if valid? && Ponytail.config.create_migration?
        next_filename = "#{Migration.migrations_path}/#{Migration.next_version}_#{name.underscore}.rb"
        open(next_filename, 'w') { |f| f.write(raw_content) }
        true
      else
        false
      end
    end

    def destroy
      if Ponytail.config.delete_migration?
        File.delete(filename)
      else
        false
      end
    end

    def current?
      version == Migration.current_version
    end
  end
end
