module Ponytail
  class Schema
    include ActiveModel::Model
    attr_accessor :version, :tables

    def initialize(params={})
      super(params)
      @version = ActiveRecord::Migrator.current_version
    end

    def tables
      table_names.sort.map do |t|
        {
          name: t,
          columns: ActiveRecord::Base.connection.columns(t),
          indexes: ActiveRecord::Base.connection.indexes(t)
        }
      end
    end

    def update(attrs)
      @version = attrs["version"].to_i
      ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, @version)
    end

    def as_json(attrs)
      {
        version: version,
        tables: tables
      }
    end

    private
    def table_names
      ActiveRecord::Base.connection.tables.delete_if { |t| t == ActiveRecord::SchemaMigration.table_name }
    end
  end
end
