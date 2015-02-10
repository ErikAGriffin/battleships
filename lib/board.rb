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

  def place(ship, origin)

    x = origin[0]
    y = origin[1]

    size = ship.size -1

    if ship.orientation == 'portrait'
      # Set ship in origin
      @grid[y][x] = ship
      size.times do
        y = next_ship_cell(y)
        @grid[y][x] = ship
      end
    end
  end

  def next_ship_cell(coord)
    if @y_cells.include? coord
      @y_cells[@y_cells.index(coord)-1]
    end
  end

end
