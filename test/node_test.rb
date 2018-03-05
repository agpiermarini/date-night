require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new(1, 'test')
    assert_instance_of Node, node
  end

  def test_it_initializes_with_left__and_right_node_nil
    node = Node.new(1, 'test')
    assert_nil node.left
    assert_nil node.right
  end

  def test_it_has_score_and_title
    node = Node.new(1, 'test')
    assert_equal 1, node.score
    assert_instance_of Integer, node.score
    assert_equal 'test', node.title
    assert_instance_of String, node.title
  end

  def test_it_can_insert_node
    node = Node.new(10, 'test')
    node.insert(9, 'test_1')
    node.insert(11, 'test_2')
    node.insert(8, 'test_3')
    node.insert(12, 'test_4')

    assert_equal 9, node.left.score
    assert_equal 11, node.right.score
    assert_equal 8, node.left.left.score
    assert_equal 12, node.right.right.score
    refute node.insert(9, 'test_1')
    refute node.insert(8, 'test_3')
  end
end
