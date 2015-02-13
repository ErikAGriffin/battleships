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
      @grid[coordinate] = :HIT
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

  def vert_next_ship_cell(coordinate)
    coordinate = coordinate.to_s.chars
    (@y_row[(@y_row.index coordinate.first) -1]+coordinate.last).to_sym
  end

  def horz_next_ship_cell(coordinate)
    coordinate = coordinate.to_s.chars
    y = coordinate.shift
    x = coordinate.join.next
    (y+x).to_sym
  end

  def portrait_ship_in_bounds?(ship,origin)
      y = origin.to_s.chars.first
      @y_row.index(y) + 1 >= ship.size
  end

  def landscape_ship_in_bounds?(ship,origin)
      x = origin.to_s.chars.last
      @x_row.index(@x_row.last) - @x_row.index(x) + 1 >= ship.size
  end

  def portrait_ship_clash?(ship,origin)
    ship.size.times do
      return false if cell(origin) != :SEA
      origin = vert_next_ship_cell(origin)
    end
    true
  end

  def landscape_ship_clash?(ship,origin)
    ship.size.times do
      return false if cell(origin) != :SEA
      origin = horz_next_ship_cell(origin)
    end
    true
  end

  def legal_placement?(ship,origin)
    if ship.portrait?
      return false if !portrait_ship_in_bounds?(ship, origin)
      return portrait_ship_clash?(ship,origin)
    else
      return false if !landscape_ship_in_bounds?(ship, origin)
      return landscape_ship_clash?(ship,origin)
    end
  end

  def place(ship, origin)
    return false if !legal_placement?(ship, origin)

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
