class Board

  attr_reader :grid

  def initialize
    @grid = {A: {1 => :SEA, 2=> :SEA},
             B: {1 => :SEA, 2=> :SEA}}
    @x_cells = [*1..2]
    @y_cells = [*:A..:B]
  end

  def cell(x, y)
    if self.grid[y]
      grid[y][x]
    end
  end

  def place(ship, origin)
    if !ship_in_bounds?(ship, origin)
      return
    end

    x = origin[0]
    y = origin[1]

    size = ship.size - 1

    if ship.portrait?
      @grid[y][x] = ship
      size.times do
        y = next_ship_cell(y)
        @grid[y][x] = ship
      end
    end
  end

  def ship_in_bounds?(ship, origin)
    if ship.portrait?
      y = origin[1]
      @y_cells.index(y) + 1 >= ship.size
    end
  end

  def next_ship_cell(coord)
    if @y_cells.include? coord
      index = @y_cells.index(coord)-1
      @y_cells[index]
    end
  end

end
