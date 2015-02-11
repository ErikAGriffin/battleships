class Game

  attr_reader :player1, :player2, :p1_ships, :p2_ships

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @p1_ships = make_ships
    @p2_ships = make_ships
  end

  def make_ships
    ship_hash = {
    aircraft_carrier: Ship.aircraft_carrier,
    battleship: Ship.battleship,
    submarine: Ship.submarine,
    destroyer: Ship.destroyer,
    patrol_boat: Ship.patrol_boat}

    ship_hash

  end


end