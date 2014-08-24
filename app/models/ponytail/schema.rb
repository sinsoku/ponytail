module Ponytail
  class Schema
    include ActiveModel::Model

    delegate_methods = [
      :current_version,
      :last_version,
      :get_all_versions,
      :schema_migrations_table_name
    ]
    delegate(*delegate_methods, to: ActiveRecord::Migrator)
    delegate :table_name, to: ActiveRecord::SchemaMigration

    class << self
      def instance
        @schema ||= new
      end
    end

    def persisted?
      ActiveRecord::Base.connection.table_exists? table_name
    end

    def rollback_version
      get_all_versions.reverse.find { |x| x < current_version }
    end

    def update(attrs)
      if Ponytail.config.update_schema?
        @version = attrs["version"].to_i
        ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, @version)
      else
        false
      end
    end

    def table_names
      ActiveRecord::Base.connection.tables.delete_if { |t| t == table_name }
    end
  end
end
