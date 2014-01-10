module Ponytail
  def self.configure(&block)
    yield @config ||= Ponytail::Configuration.new
  end

  def self.config
    @config
  end

  def self.rails4?
    ActiveRecord::VERSION::MAJOR >= 4
  end

  def self.check_pending?
    Rails.application.config.middleware.include?(ActiveRecord::Migration::CheckPending)
  end

  class Configuration
    include ActiveSupport::Configurable
    config_accessor :update_schema
    config_accessor :create_migration
    config_accessor :delete_migration

    alias :create_migration? :create_migration
    alias :delete_migration? :delete_migration

    # for lazy load
    def update_schema
      config.update_schema = config.update_schema.call if config.update_schema.respond_to?(:call)
      config.update_schema
    end
    alias :update_schema? :update_schema
  end

  configure do |config|
    config.update_schema = lambda { !(rails4? && check_pending?) }
    config.create_migration = true
    config.delete_migration = true
  end
end
