# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ponytail/version'

Gem::Specification.new do |spec|
  spec.name          = "ponytail"
  spec.version       = Ponytail::VERSION
  spec.authors       = ["sinsoku"]
  spec.email         = ["sinsoku.listy@gmail.com"]
  spec.description   = %q{Ponytail is a Rails engine that shows the migrations.}
  spec.summary       = %q{Ponytail is a Rails engine that shows the migrations.}
  spec.homepage      = "https://github.com/sinsoku/ponytail"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '~> 4.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "jasmine"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "sqlite3"
end
