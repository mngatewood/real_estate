class Room

  attr_reader :category

  def initialize(category, x, y)
    @category = category
    @x = x
    @y = y
  end

  def area
    @x * @y
  end

end