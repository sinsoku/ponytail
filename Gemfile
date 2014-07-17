source 'https://rubygems.org'

ruby '2.1.2'

# Specify your gem's dependencies in ponytail.gemspec
gemspec

gem 'rake'

group :development do
  gem 'byebug'
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'rubocop'
end

group :test do
  gem 'coveralls', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'uglifier'
end
