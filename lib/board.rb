class Board

  attr_reader :grid

  def initialize
    @grid = {A: {1 => :SEA, 2=> :SEA},
             B: {1 => :SEA, 2=> :SEA}}
  end

  def cell(x,y)
    self.grid[y][x]
  end



end
