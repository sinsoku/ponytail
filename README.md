# Ponytail

[![Gem Version](https://badge.fury.io/rb/ponytail.png)](http://badge.fury.io/rb/ponytail)
[![Build Status](https://travis-ci.org/sinsoku/ponytail.png?branch=develop)](https://travis-ci.org/sinsoku/ponytail)
[![Coverage Status](https://coveralls.io/repos/sinsoku/ponytail/badge.png?branch=develop)](https://coveralls.io/r/sinsoku/ponytail?branch=develop)
[![Code Climate](https://codeclimate.com/github/sinsoku/ponytail.png)](https://codeclimate.com/github/sinsoku/ponytail)

Ponytail is a Rails engine that shows the migrations.

## Installation

Add `ponytail` to `:development` groups in your application's Gemfile:

```ruby
group :development do
  gem 'ponytail'
end
```

And then execute:

```bash
$ bundle
```

Comment out `config.active_record.migration_error` in `config/environments/development.rb`.

```ruby
  # Raise an error on page load if there are pending migrations
  # config.active_record.migration_error = :page_load
```

## Usage

Visit `/ponytail/migrations` in your app.

## How to work dummy app

```bash
$ rake db:migrate:reset
$ cd spec/dummy
$ rails s
```

## Example site

Dummy app is deploying on heroku. However, you can not change the migration files and databases.

http://ponytail.herokuapp.com/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
