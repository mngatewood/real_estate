class Room

  attr_reader :category, :area

  def initialize(category, x, y)
    @category = category
    @area = x * y
  end

end