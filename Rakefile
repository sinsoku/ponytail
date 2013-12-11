require "bundler/gem_tasks"
require "rspec/core/rake_task"
load "jasmine/tasks/jasmine.rake"
ENV['JASMINE_SPEC_FORMAT'] = 'documentation'

RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, 'jasmine:ci']
