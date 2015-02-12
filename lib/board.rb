class Board

  attr_reader :grid

  def initialize
    @x_row = [*1..2]
    @y_row = [*:A..:B]
    @grid = make_grid
  end

  # Plan on refactoring entire coordinate system
  # May make a single hash of coordinates.

  def shoot(coordinate)
    if cell(coordinate).respond_to?(:sunk?)
      cell(coordinate).hit
      x = coordinate.first
      y = coordinate.last
      @grid[y][x] = :HIT
    else
      cell(coordinate) == :HIT ? :DUPL : :MISS
    end
  end

  def make_grid
    board_hash = {}
    @y_row.each do |y|
      board_hash.store(y,{})
      @x_row.each do |x|
        board_hash[y].store(x,:SEA)
      end
    end
    board_hash
  end

  def cell(origin)
    x = origin[0]
    y = origin[1]
    if self.grid[y]
      grid[y][x]
    end
  end

  def ship_in_bounds?(ship, origin)
    if ship.portrait?
      portrait_ship_in_bounds?(ship,origin)
    else
       landscape_ship_in_bounds?(ship,origin)
    end
  end

  def portrait_ship_in_bounds?(ship,origin)
      y = origin[1]
      @y_row.index(y) + 1 >= ship.size
  end

  def landscape_ship_in_bounds?(ship,origin)
      x = origin[0]
      @x_row.index(@x_row.last) - @x_row.index(x) + 1 >= ship.size
  end

  # !! ** !!
  # Need to add edge case, adding ship where another
  # Ship already resides

  def next_ship_cell(point)
    if @y_row.include? point
      return @y_row[@y_row.index(point)-1]
    end
    if @x_row.include? point
      return @x_row[@x_row.index(point)-1]
    end
  end

  def place(ship, origin)
    return false if !ship_in_bounds?(ship, origin)
    x = origin[0]
    y = origin[1]

    @grid[y][x] = ship
    size = ship.size - 1
    if ship.portrait?
      size.times do
        y = next_ship_cell(y)
        @grid[y][x] = ship
      end # size.times do
    else
      size.times do
        x = next_ship_cell(x)
        @grid[y][x] = ship
      end # size.times do
    end # if
    true # Returns true if ship was placed
  end

end
