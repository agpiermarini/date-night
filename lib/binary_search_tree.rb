require './lib/node'

class BinarySearchTree
  attr_reader :root
  def initialize(root_score = nil, root_title = nil)
    @root = Node.new(root_score, root_title)
  end
end
