require 'foodtaster'

RSpec.configure do |config|
  config.color_enabled = true
end

Foodtaster.configure do |config|
  config.skip_rollback = !ENV["SKIPROLLBACK"].nil?
end
