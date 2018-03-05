require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new(1, 'test')
    assert_instance_of Node, node
  end

  def test_it_initializes_with_left_node_nil
    node = Node.new(1, 'test')
    assert_nil node.left_node
  end

  def test_it_has_score_and_title
    node = Node.new(1, 'test')
    assert_equal 1, node.score
    assert_equal 'test', node.title
  end
end
