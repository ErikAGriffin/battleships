class Board

  attr_reader :grid

  def initialize
    @grid = {A: {1 => :SEA, 2=> :SEA},
             B: {1 => :SEA, 2=> :SEA}}
    @x_row = [*1..2]
    @y_row = [*:A..:B]
  end

  def cell(origin)
    x = origin[0]
    y = origin[1]
    if self.grid[y]
      grid[y][x]
    end
  end

  def cell(x, y)
    if self.grid[y]
      grid[y][x]
    end
  end



  def ship_in_bounds?(ship, origin)
    if ship.portrait?
      y = origin[1]
      @y_row.index(y) + 1 >= ship.size
    else
      x = origin[0]
      @x_row.index(@x_row.last) - @x_row.index(x) + 1 >= ship.size 
    end
  end

  def next_ship_cell(coord)
    if @y_row.include? coord
      return @y_row[@y_row.index(coord)-1]
    end
    if @x_row.include? coord
      return @x_row[@x_row.index(coord)-1]
    end


  end

  def place(ship, origin)
    return if !ship_in_bounds?(ship, origin)

    x = origin[0]
    y = origin[1]

    size = ship.size - 1
    @grid[y][x] = ship
    if ship.portrait?
      size.times do
        y = next_ship_cell(y)
        @grid[y][x] = ship
      end # size.times
    else
      size.times do
        x = next_ship_cell(x)
        @grid[y][x] = ship
      end # size.times
    end # if

  end
end
