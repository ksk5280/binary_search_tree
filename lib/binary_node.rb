require 'pry'
require_relative 'tree'

class BinaryNode
  attr_accessor :data, :left, :right, :depth

  def initialize(value, depth=0)
    @data = value
    @left = nil
    @right = nil
    @depth = depth
  end

end
