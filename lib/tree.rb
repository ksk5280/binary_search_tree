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

  def depth_of(data)
    depth_of_recursively(head, data)
  end

  def depth_of_recursively(node, data)
    if !node
      nil
    elsif data == node.data
      node.depth
    elsif data < node.data
      depth_of_recursively(node.left, data)
    else
      depth_of_recursively(node.right, data)
    end
  end

  def max (node = head)
    if !node
      nil
    elsif !node.right.nil?
      max(node.right)
    else
      node.data
    end
  end

  def min (node = head)
    if !node
      nil
    elsif !node.left.nil?
      min(node.left)
    else
      node.data
    end
  end

  def sort (node = head)
    if !node
      []
    else
      [
        sort(node.left),
        [ node.data ],
        sort(node.right)
      ].flatten
    end
  end

  def load(read_file)
    count = 0
    File.read(read_file).split.each do |number|
      if insert(number)
        count += 1
      end
    end
    count
  end

  def leaves (node = head)
    if !node
      0
    elsif !node.left && !node.right
      1
    else
      leaves(node.left) + leaves(node.right)
    end
  end

  def height (node = head)
    if !node
      -1
    elsif !node.left && !node.right
      node.depth
    else
      [
        height(node.left), height(node.right)
      ].max
    end
  end
end
