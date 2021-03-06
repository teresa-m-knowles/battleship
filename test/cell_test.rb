require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_a_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_ship_returns_nil_when_initialized
    cell = Cell.new("B4")
    assert_nil cell.ship
  end

  def test_cell_is_empty_when_initialized
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end

  def test_that_when_a_ship_is_placed_the_ship_method_returns_that_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

def test_that_when_ship_is_placed_the_cell_is_not_empty
  cell = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell.place_ship(cruiser)
  assert_equal false, cell.empty?
end

def test_that_fired_upon_method_is_false_when_not_fired_upon
  cell = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell.place_ship(cruiser)
  assert_equal false, cell.fired_upon?

end

def test_that_when_fired_upon_the_fired_upon_question_method_returns_true
  cell = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell.place_ship(cruiser)
  cell.fire_upon
  assert cell.fired_upon?
end

def test_that_if_cell_has_a_ship_and_it_is_fired_upon_the_ships_health_will_reduce
  cell = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell.place_ship(cruiser)
  cell.fire_upon
  assert_equal 2, cell.ship.health
end

def test_that_status_is_rendered_as_a_dot
  cell_1 = Cell.new("B4")
  assert_equal ".", cell_1.render
end

def test_that_cell_shows_when_a_ship_was_hit
  cell_1 = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell_1.place_ship(cruiser)
  cell_1.fire_upon

  assert_equal "H", cell_1.render
end

def test_that_cell_shows_when_a_shot_missed
  cell_1 = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell_1.fire_upon
  assert_equal "M", cell_1.render
end

def test_that_cell_shows_X_when_ship_is_sunk
  cell_1 = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell_1.place_ship(cruiser)
  cruiser.hit
  cruiser.hit
  cell_1.fire_upon

  assert_equal "X", cell_1.render

end

def test_that_cell_shows_an_S_when_needed
  cell_1 = Cell.new("B4")
  cruiser = Ship.new("Cruiser", 3)
  cell_1.place_ship(cruiser)
  assert_equal "S", cell_1.render(true)
end



end
