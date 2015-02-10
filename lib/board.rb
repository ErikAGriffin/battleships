class Board

  attr_reader :grid

  def initialize
    @grid = {A: {1 => :SEA, 2=> :SEA},
             B: {1 => :SEA, 2=> :SEA}}
    @x_cells = [*1..2]
    @y_cells = [*:A..:B]
  end

  def cell(x,y)
    if self.grid[y]
      grid[y][x]
    end
  end

  def place(ship, origin)

    x = origin[0]
    y = origin[1]

    size = ship.size -1

    if ship.orientation == 'portrait'
      ship_in_bounds?(ship,origin)
      # Set ship in origin
      @grid[y][x] = ship
      size.times do
        y = next_ship_cell(y)
        @grid[y][x] = ship
      end
    end
  end

  def ship_in_bounds?(ship,origin)

    x = origin[0]
    y = origin[1]
    size = ship.size-1

    if ship.orientation == 'portrait'
        size.times do
          y = next_ship_cell(y)
        end
    end
    cell(x,y)

  end

  def next_ship_cell(coord)
    if @y_cells.include? coord
      @y_cells[@y_cells.index(coord)-1]
    end
  end

end
