require './lib/board'
class Player


  def initialize(home_board: Board.new, target_board: Board.new)
    @home_board = home_board
    @target_board = target_board
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)
    @home_board.place(ship, origin)
  end

  def shoot(origin)

  end

  # I don't believe other classes need access to these
  # So after testing will probably delete.
  def home_board
    @home_board
  end

  def target_board
    @target_board
  end





end