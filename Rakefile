require "bundler/gem_tasks"

if ENV['RAILS_ENV'] != "production"
  require "rspec/core/rake_task"
  load "jasmine/tasks/jasmine.rake"
  ENV['JASMINE_SPEC_FORMAT'] = 'documentation'

  RSpec::Core::RakeTask.new(:spec)

  task :default => [:spec, 'jasmine:ci']
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
