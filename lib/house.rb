require 'pry'

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
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    room_areas = @rooms.map do |room|
      room.area
    end
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

end