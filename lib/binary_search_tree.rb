require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  # def insert(score, title)
  #   new_node = Node.new(score, title)
  #   @root = new_node if @root.nil?
  #   node = @root
  #   depth = 0
  #   until node.score == new_node.score
  #     depth += 1
  #     if new_node.score < node.score
  #       node.left_node ||= new_node
  #       node = node.left_node
  #     elsif new_node.score > node.score
  #       node.right_node ||= new_node
  #       node = node.right_node
  #     else
  #       node = new_node
  #     end
  #   end
  #   depth
  # end

  def insert(score, title)
    @root = Node.new(score, title) if @root.nil?
    @root.insert(score, title)
    depth_of(score)
  end

  def depth_of(score, node = @root)
    depth = 0
    until score == node.score
      depth += 1
      score <= node.score ? node = node.left : node = node.right
      return nil if node.nil?
    end
    depth
  end
end
