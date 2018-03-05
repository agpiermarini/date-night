class Node
  attr_reader   :score,
                :title
  attr_accessor :left,
                :right
  def initialize(score, title)
    @score = score
    @title = title
    @left = nil
    @right = nil
  end

  def insert(score, title)
    if score < @score
      @left.nil? ? @left = Node.new(score, title) : @left.insert(score, title)
    elsif score > @score
      @right.nil? ? @right = Node.new(score, title) : @right.insert(score, title)
    else
      false
    end
  end
end
