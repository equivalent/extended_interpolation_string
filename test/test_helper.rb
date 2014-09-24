require 'bundler/setup'
require 'extended_interpolation_string'
require 'minitest/autorun'
require 'ostruct'

class Minitest::Spec
  class << self
    alias :context :describe
  end
end
