if ENV["TRAVIS"]
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_group 'Models', 'app/models'
    add_group 'Controllers', 'app/controllers'
    add_group 'Lib', 'lib'

    add_filter 'spec'
    add_filter 'vendor'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ponytail'

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
Capybara.app = Dummy::Application
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

app_dir = File.expand_path('../../app', __FILE__)
Dir.glob("#{app_dir}/**/*.rb").each { |f| require f }
