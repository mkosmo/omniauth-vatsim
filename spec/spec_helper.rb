$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rspec"
require "webmock/rspec"
require "rack/test"
require "omniauth"
require "omniauth-vatsim"
