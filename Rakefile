require "bundler/gem_tasks"

if ENV['RAILS_ENV'] != "production"
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  # task default: [:spec, :rubocop]
  task default: :spec
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
