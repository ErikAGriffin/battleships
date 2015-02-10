class Board

  attr_reader :grid

  def initialize
    @grid = {A: {1 => :SEA, 2=> :SEA},
             B: {1 => :SEA, 2=> :SEA}}
    @x_cells = [*1..2]
    @y_cells = [*:A..:B]
  end

  def cell(x,y)
    # It may be fine to return nil
    raise("Out of bounds") if !@x_cells.include?(x)
    raise("Out of bounds") if !@y_cells.include?(y)
    self.grid[y][x]
  end

  def place(ship, x, y)
    size = ship.size
    ship
  end

end
