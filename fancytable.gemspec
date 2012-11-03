# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fancy_table/version'

Gem::Specification.new do |gem|
  gem.name          = 'fancytable'
  gem.version       = FancyTable::VERSION
  gem.authors       = ['Caleb Thompson']
  gem.email         = ['cjaysson@gmail.com']
  gem.description   = %q{Happy Simple Fancy Tables}
  gem.summary       = %q{Build HTML5 tables from ActiveRecord::Relations in just a few lines.}
  gem.homepage      = 'calebthompson.github.com/fancytable'
  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ['app', 'lib']

  gem.add_dependency 'railties'
  gem.add_dependency 'rails'

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'sqlite3'
  gem.add_dependency 'rspec'
end
