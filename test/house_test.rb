require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    
    assert_instance_of House, house
  end
  
  def test_it_has_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    house.add_room(room_1)
    house.add_room(room_2)
    
    assert_equal 2, house.rooms.count
    assert_equal 130, house.rooms[0].area
    assert_equal 165, house.rooms[1].area
  end

  def big_house
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    return house
  end
  
  def test_it_can_have_more_rooms
    assert_equal 2, big_house.rooms_from_category(:bedroom).count
    assert_equal 1, big_house.rooms_from_category(:basement).count
  end

  def test_it_has_house_area
    assert_equal 1900, big_house.area
  end

  def test_it_has_price_per_square_foot
    assert_equal 210.53, big_house.price_per_square_foot
  end

  def test_it_sorts_rooms_by_area
    expected = [:basement, :living_room, :bedroom, :bedroom]
    actual = big_house.rooms_sorted_by_area.map {|r|r.category}

    assert_equal expected, actual
  end

  def test_it_sorts_rooms_by_category
    expected = [:basement, :bedroom, :bedroom, :living_room]
    actual = big_house.rooms_sorted_by_category.map {|r|r.category}

    assert_equal expected, actual
  end

end