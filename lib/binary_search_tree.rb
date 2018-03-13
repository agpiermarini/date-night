require './lib/node'
require './lib/file_parser'

class BinarySearchTree
  include FileParser
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(score, title)
    @root = Node.new(score, title) if @root.nil?
    @root.insert(score, title)
    depth_of(score)
  end

  def depth_of(score)
    node = @root
    depth = 0
    until score == node.score
      depth += 1
      node = score < node.score ? node.left : node.right
      return nil if node.nil?
    end
    depth
  end

  def include?(score, node = @root)
    return false if node.nil?
    return true if score == node.score
    node = score < node.score ? node.left : node.right
    include?(score, node)
  end

  def max(node = @root)
    node.right.nil? ? node : max(node.right)
  end

  def min(node = @root)
    node.left.nil? ? node : min(node.left)
  end

  def find_by_score(score, node = @root)
    return node if node.nil? || score == node.score
    node = score < node.score ? node.left : node.right
    find_by_score(score, node)
  end

  def sort
    (1..100).map do |score|
      node = find_by_score(score)
      node.nil? ? nil : { node.title => node.score }
    end.compact
  end

  def load(file)
    movies = parse_txt(file)
    movies.each do |movie|
      score, title = movie.split(", ")
      insert(score.to_i, title.strip)
    end
    movies.length
  end
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

# def insert(score, title)
#   @root = Node.new(score, title) if @root.nil?
#   node = @root
#   until score == node.score
#     score < node.score ? (node = (node.left ||= Node.new(score, title))) : (node = (node.right ||= Node.new(score, title)))
#   end
#   depth_of(score)
# end
#
# def max
#   node = @root
#   loop do
#     return node if node.right.nil?
#     node = node.right
#   end
# end
#
# def min
#   node = @root
#   loop do
#     return node if node.left.nil?
#     node = node.left
#   end
# end
#
# def find_by_score(score)
#   node = @root
#   loop do
#     return node if score == node.score
#     score < node.score ? (node = node.left) : (node = node.right)
#     return nil if node.nil?
#   end
# end
# 
# def include?(score)
#   node = @root
#   loop do
#     return true if score == node.score
#     score < node.score ? (node = node.left) : (node = node.right)
#     return false if node.nil?
#   end
# end
