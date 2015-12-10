#!/usr/bin/ruby
require 'pry-byebug'
require 'pry-rescue'
require 'pry'
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
      0
    else
      insert_recursively(head, data)
    end
  end

  def insert_recursively(node, data)
    if data < node.data
      if node.left
        insert_recursively(node.left, data)
      else
        node.left = BinaryNode.new(data, node.depth + 1)
        node.left.depth
      end
    elsif data > node.data
      if node.right
        insert_recursively(node.right, data)
      else
        node.right = BinaryNode.new(data, node.depth + 1)
        node.right.depth
      end
    else
      nil
    end
  end

  def include?(data)
    !depth_of(data).nil?
  end

  def depth_of(data)
    depth_of_recursively(head, data)
  end

  def depth_of_recursively(node, data)
    if !node
      return nil
    elsif data == node.data
      return node.depth
    elsif data < node.data
      depth_of_recursively(node.left, data)
    else
      depth_of_recursively(node.right, data)
    end
  end

  def max
    max_recursively(head)
  end

  def max_recursively(node)
    if !node
      nil
    elsif !node.right.nil?
      max_recursively(node.right)
    else
      node.data
    end
  end

  def min
    min_recursively(head)
  end

  def min_recursively(node)
    if !node
      nil
    elsif !node.left.nil?
      min_recursively(node.left)
    else
      node.data
    end
  end

  def sort
    sort_recursively(head)
  end

  def sort_recursively(node)
    if !node
      []
    else
      [
        sort_recursively(node.left),
        [ node.data ],
        sort_recursively(node.right)
      ].flatten
    end
  end

  def load(read_file)
    count = 0
    File.read(read_file).chomp.split.each do |number|
      if insert(number)
        count += 1
      end
    end
    count
  end

  def leaves
    leaves_recursively(head)
  end

  def leaves_recursively(node)
    if !node
      0
    elsif !node.left && !node.right
      1
    else
      leaves_recursively(node.left) + leaves_recursively(node.right)
    end
  end

  def height
    height_recursively(head)
  end

  def height_recursively(node)
    if !node
      -1
    elsif !node.left && !node.right
      node.depth
    else
      [
        height_recursively(node.left), height_recursively(node.right)
      ].max
    end
  end
end

if __FILE__ == $0
  tree = Tree.new
  p tree.insert(10)


end
