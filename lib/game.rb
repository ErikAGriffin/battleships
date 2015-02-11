class Game

  attr_reader :player1, :player2, :p1_ships, :p2_ships, :turn

  def initialize
    new_game
  end

  # I believe I am combining what I normally call 'driver'
  # and the class the controls game logic.
  # so perhaps separate into the game logic and driver classes.

  def new_game
    @p1_board = Board.new
    @p2_board = Board.new

    @player1 = Player.new(home_board:@p1_board,game:self)
    @player2 = Player.new(home_board:@p2_board,game:self)

    @p1_ships = Game.make_ships
    @p2_ships = Game.make_ships
  end

  def turn
    @turn ||= @player1
  end

  # Class Methods

  def Game.make_ships
    ship_hash = {
    aircraft_carrier: Ship.aircraft_carrier,
    battleship: Ship.battleship,
    submarine: Ship.submarine,
    destroyer: Ship.destroyer,
    patrol_boat: Ship.patrol_boat}
    ship_hash
  end


end