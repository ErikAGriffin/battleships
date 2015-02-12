class Board

  attr_reader :grid

  def initialize

    #grid = {A1: :SEA, A2: :SEA, ... J9: :SEA, J10: :SEA}

    @x_row = [*'1'..'10']
    @y_row = [*'A'..'J']
    @grid = make_grid
  end

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
      @x_row.each do |x|
        board_hash.store((y+x).to_sym,:SEA)
      end
    end
    board_hash
  end

  def cell(origin)
    grid[origin]
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

  def vert_next_ship_cell(coordinate)

  end

  def horz_next_ship_cell(coordinate)

  end

  def place(ship, origin)
    return false if !ship_in_bounds?(ship, origin)

    @grid[origin] = ship
    size = ship.size - 1
    if ship.portrait?
      size.times do
        origin = vert_next_ship_cell(origin)
        @grid[origin] = ship
      end # size.times do
    else
      size.times do
        origin = horz_next_ship_cell(origin)
        @grid[origin] = ship
      end # size.times do
    end # if
    true # Returns true if ship was placed
  end

end
