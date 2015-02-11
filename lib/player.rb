require './lib/board'
class Player


  def initialize(home_board = Board.new)
    @home_board = home_board
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)

  end

  # I don't believe other classes need access to this
  def home_board
    @home_board
  end


end