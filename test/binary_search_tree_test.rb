require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_it_initializes_with_root_node
    tree = BinarySearchTree.new
    assert_instance_of Node, tree.root
  end

  def test_root_node_initializes_with_score_title_nil
    tree = BinarySearchTree.new
    assert_nil tree.root.title
    assert_nil tree.root.score
  end

  def test_can_insert_node
    tree = BinarySearchTree.new
  end
end
