if ENV["TRAVIS"]
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_group 'Lib', 'lib'

    add_filter 'spec'
    add_filter 'vendor'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record'
require 'rails'
require 'ponytail'
