require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require 'binary_node'       # ~> LoadError: cannot load such file -- binary_node
require 'tree'
require 'pry'

class TreeTest < Minitest::Test
  def setup
    @tree = Tree.new
    # @tree.load('numbers.txt')
  end

  def test_class_exists
    assert Tree
  end

  def test_can_be_initialized_with_nil_head
    assert_nil @tree.head
  end

  def test_insert_initializes_node
    @tree.insert("m")
    assert_equal BinaryNode, @tree.head.class
  end

  def test_can_insert_multiple_nodes
    @tree.insert(10)
    @tree.insert(12)
    @tree.insert(8)
    @tree.insert(5)

    assert_equal 10, @tree.head.data
    assert_equal 12, @tree.head.right.data
    assert_equal 8, @tree.head.left.data
    assert_equal 5, @tree.head.left.left.data
  end

  def test_inserted_node_returns_depth
    assert_equal 0, @tree.insert(10)
    assert_equal 1, @tree.insert(12)
    assert_equal 1, @tree.insert(8)
    assert_equal 2, @tree.insert(5)
  end

  def test_can_tell_whether_specific_data_is_included
    @tree.insert(10)
    @tree.insert(12)
    @tree.insert(8)
    @tree.insert(5)

    assert_equal true, @tree.include?(10)
    assert_equal false, @tree.include?(9)
    assert_equal true, @tree.include?(12)
    assert_equal true, @tree.include?(8)
    assert_equal true, @tree.include?(5)
    assert_equal false, @tree.include?(0)
  end

  def test_can_return_depth_of_piece_of_data
    @tree.insert(10)
    @tree.insert(12)
    @tree.insert(8)
    @tree.insert(5)

    assert_equal nil, @tree.depth_of(0)
    assert_equal 0, @tree.depth_of(10)
    assert_equal 1, @tree.depth_of(8)
    assert_equal 2, @tree.depth_of(5)
  end

  def test_can_return_max_value_in_tree
    @tree.insert(10)
    @tree.insert(12)
    @tree.insert(18)
    @tree.insert(15)

    assert_equal 18, @tree.max
  end

  def test_can_return_min_value_in_tree
    @tree.insert(10)
    @tree.insert(1)
    @tree.insert(4)
    @tree.insert(15)

    assert_equal 1, @tree.min
  end

  def test_can_create_a_sorted_array
    @tree.insert(10)
    @tree.insert(1)
    @tree.insert(4)
    @tree.insert(15)

    assert_equal [1,4,10,15], @tree.sort
  end

  def test_can_load_numbers_and_return_unique_count
    assert_equal 5, @tree.load('numbers.txt')
  end

  def test_can_return_number_of_leaves
    @tree.load('numbers.txt')

    assert_equal 2, @tree.leaves
  end

  def test_can_return_height_of_tree
    @tree.load('numbers.txt')

    assert_equal 2, @tree.height
  end
end

# ~> LoadError
# ~> cannot load such file -- binary_node
# ~>
# ~> /Users/kimiko/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/kimiko/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/kimiko/Documents/Turing/1module/projects/binary_search_tree/test/tree_test.rb:3:in `<main>'
