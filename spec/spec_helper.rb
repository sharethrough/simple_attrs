require 'bundler/setup'
Bundler.setup
require 'simple_attrs'
require 'byebug'

RSpec.configure do |config|
  config.order = :random
end
