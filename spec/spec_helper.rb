#require 'rubygems'
#require 'bundler/setup'
#require 'pry'

#ENV['RAILS_ENV'] = 'test'
#
#require File.expand_path('../../spec/dummy/config/environment', __FILE__)
#ENV['RAILS_ROOT'] = File.expand_path('../../spec/dummy', __FILE__)
require 'fancy_table'

# Dir['spec/support/**/*.rb'].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.mock_with(:mocha)
end
