if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear! do
    add_group 'Lib', 'lib'

    add_filter 'spec'
    add_filter 'vendor'
  end
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record'
require 'rails'
require 'ponytail'
