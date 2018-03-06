require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  # def test_it_initializes_with_root_nil
  #   tree = BinarySearchTree.new
  #   assert_nil tree.root
  # end

  def test_can_insert_node
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, tree.root.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.root.title
  end

  def test_insert_returns_depth_of_node
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_can_insert_second_node
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 16, tree.root.left.score
    assert_equal "Johnny English", tree.root.left.title
  end

  def test_can_insert_more_than_two_nodes
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 92, tree.root.right.score
    assert_equal "Sharknado 3", tree.root.right.title
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 50, tree.root.left.right.score
    assert_equal "Hannibal Buress: Animal Furnace", tree.root.left.right.title
  end

  def test_it_can_find_depth_of_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, tree.depth_of(61)
    assert_equal 1, tree.depth_of(16)
    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
    assert_nil tree.depth_of(1000)
  end

  def test_include_method
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert tree.include?(61)
    assert tree.include?(16)
    assert tree.include?(92)
    assert tree.include?(50)
    refute tree.include?(1000)
  end

  def test_max_method
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_instance_of Node, tree.max
    assert_equal 92, tree.max.score
    assert_equal "Sharknado 3", tree.max.title

    tree.insert(99, "The Goonies")
    assert_equal 99, tree.max.score
    assert_equal "The Goonies", tree.max.title
  end

  def test_min_method
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_instance_of Node, tree.min
    assert_equal 16, tree.min.score
    assert_equal "Johnny English", tree.min.title

    tree.insert(4, "Jaws: The Revenge")
    assert_equal 4, tree.min.score
    assert_equal "Jaws: The Revenge", tree.min.title
  end

  def test_sort_method
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = [{"Johnny English"=>16},
                {"Hannibal Buress: Animal Furnace"=>50},
                {"Bill & Ted's Excellent Adventure"=>61},
                {"Sharknado 3"=>92}]

    assert_instance_of Array, tree.sort
    assert_equal expected, tree.sort
  end
end
