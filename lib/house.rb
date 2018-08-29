class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price    = price
    @address  = address
    @rooms    = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category == category}
  end

  def area
    room_areas = @rooms.map {|room| room.area}
    room_areas.sum
  end

  def price_per_square_foot
    price = @price[1..-1].to_f
    (price / area).round(2)
  end

  def rooms_sorted_by_area
    rooms = @rooms.sort_by {|room| room.area}
    rooms.reverse
  end

  def rooms_sorted_by_category
    @rooms.sort_by {|room| room.category}
  end

end