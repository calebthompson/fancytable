# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fancy_table/version'

Gem::Specification.new do |gem|
  gem.name          = "fancytable"
  gem.version       = FancyTable::VERSION
  gem.authors       = ["Caleb Thompson"]
  gem.email         = ["cjaysson@gmail.com"]
  gem.description   = %q{Happy Simple Fancy Tables}
  gem.summary       = %q{Build HTML5 tables from ActiveRecord::Relations in just a few lines.}
  gem.homepage      = "calebthompson.github.com/fancytable"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
