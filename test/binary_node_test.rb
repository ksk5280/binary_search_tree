require 'minitest/autorun'
require 'minitest/pride'
require 'binary_node'
require 'tree'

class BinaryNodeTest < Minitest::Test
  def setup
    @tree = Tree.new
    @node1 = BinaryNode.new(10, 0)
    @node2 = BinaryNode.new(8, 1)
  end

  def test_class_exists
    assert BinaryNode
  end

  def test_node_can_be_initialize_with_data
    assert_equal 10, @node1.data
    assert_nil @node1.left
    assert_nil @node1.right
  end
end
