#!/usr/bin/ruby
require_relative 'binary_node'

class Tree
  attr_reader :head

  def initialize
    @head = nil
    @current_node = nil
  end

  def insert(data)
    if head == nil
      @head = BinaryNode.new(data, 0)
      return 0
    else
      insert_recursively(head, data)
    end
  end

  def insert_recursively(node, data)
    if data < node.data
      insert_left(node, data)
    elsif data > node.data
      insert_right(node, data)
    else
      nil
    end
  end

  def insert_left(node, data)
      if node.left
        insert_recursively(node.left, data)
      else
        node.left = BinaryNode.new(data, node.depth + 1)
        node.left.depth
      end
  end

  def insert_right(node, data)
      if node.right
        insert_recursively(node.right, data)
      else
        node.right = BinaryNode.new(data, node.depth + 1)
        node.right.depth
      end
  end

  def include?(data)
    !depth_of(data).nil?
  end

  def depth_of(node = head, data)
    return nil if !node

    return node.depth if data == node.data

    if data < node.data
      depth_of(node.left, data)
    else
      depth_of(node.right, data)
    end
  end

  def max (node = head)
    return nil if !node

    if !node.right.nil?
      max(node.right)
    else
      node.data
    end
  end

  def min (node = head)
    return nil if !node

    if !node.left.nil?
      min(node.left)
    else
      node.data
    end
  end

  def sort (node = head)
    if !node
      []
    else
      [ sort(node.left), [ node.data ], sort(node.right) ].flatten
    end
  end

  def load(read_file)
    count = File.read(read_file).split.count do |number|
      insert(number)
    end
  end

  def leaves (node = head)
    return 0 if !node

    return 1 if !node.left && !node.right

    else leaves(node.left) + leaves(node.right)
  end

  def height (node = head)
    return -1 if !node

    if !node.left && !node.right
      node.depth
    else
      [ height(node.left), height(node.right) ].max
    end
  end
end

if __FILE__ == $0
  tree = Tree.new
  tree.insert("m")
  tree.insert("c")
  tree.insert("q")
  tree.insert("a")
end
