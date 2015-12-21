# Binary Search Tree

## Turing School: Module 1, Project 2

### Project Overview

A binary search tree is a fundamental data structure useful for organizing large sets of data.
More on Wikipedia: http://en.wikipedia.org/wiki/Binary_search_tree

The purpose of this project is to create a binary search tree built from nodes. Each node has:

* A) An element of data
* B) A link to the *left*. All nodes to the left have data elements less/lower than this node's data element.
* C) A link to the *right*. All nodes to the right have data elementes more/greater than this node's data element.

## Tree interactions

The binary search tree can fulfill each of the interactions below.

We start with:

```ruby
tree = BinarySearchTree.new
```

### `insert`

The `insert` method adds a new node with the passed-in data. It returns the
depth of the new node in the tree:

```ruby
tree.insert("m")
# => 0
tree.insert("c")
# => 1
tree.insert("q")
# => 1
tree.insert("a")
# => 2
```

For all the later methods defined here, assume that we've run these four inserts.

### `include?`

The `include?` method verifies/rejects the presence of a piece of data in the tree:

```ruby
tree.include?("q")
# => true
tree.include?("b")
# => false
```

### `depth_of`

The `depth_of` method reports the depth of the tree where a piece of data appears:

```ruby
tree.depth_of("q")
# => 1
tree.depth_of("a")
# => 2
```

### `max`

The `max` method returns the largest value present in the tree:

```ruby
tree.max
# => "q"
```

### `min`

The `min` method returns the smallest value present in the tree:

```ruby
tree.min
# => "a"
```

### `sort`

The `sort` method returns an array of all the elements in sorted order. 

```ruby
tree.sort
# => ["a", "c", "m", "q"]
```

### `load`

The `load` method loads a file named `numbers.txt` with one value per line. The return value is the number of unique values inserted into the tree. If
a number is present more than one time in the input file *or* already present in
the tree when `load` is called, it is ignored:

```ruby
tree.load('numbers.txt')
# => 224
```

### `leaves`

The `leaves` method returns the number of leaf nodes on the tree:

```ruby
tree.leaves
# => 2
```

### `height`

The `height` method returns the height (aka the maximum depth) of the tree:

```ruby
tree.height
# => 3
```
