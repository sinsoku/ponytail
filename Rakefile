require "bundler/gem_tasks"
require "rspec/core/rake_task"
load "jasmine/tasks/jasmine.rake"
ENV['JASMINE_SPEC_FORMAT'] = 'documentation'

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, 'jasmine:ci']
