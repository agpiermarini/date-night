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

  def depth_of(score, node = @root, depth = 0)
    return nil if node.nil?
    return depth if score == node.score
    node = score < node.score ? node.left : node.right
    depth_of(score, node, depth += 1)
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
      score, title = movie.split(', ')
      insert(score.to_i, title.strip)
    end
    movies.length
  end
end
