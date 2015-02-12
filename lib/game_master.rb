class GameMaster

  def initialize
    board1 = Board.new
    board2 = Board.new
    player1 = Player.new(homeboard:board1)
    player2 = Player.new(homeboard:board2)
    ships1 = GameMaster.make_ships
    ships2 = GameMaster.make_ships
    players = [player1, player2]
    ships = [ships1, ships2]
    @game = Game.new(players: players, ships: ships)
  end

  def get_game
    puts "HEY!#{@game}"
    return @game
  end
  # Class Methods

  def GameMaster.make_ships
    ship_hash = {
    aircraft_carrier: Ship.aircraft_carrier,
    battleship: Ship.battleship,
    submarine: Ship.submarine,
    destroyer: Ship.destroyer,
    patrol_boat: Ship.patrol_boat}
    ship_hash
  end

  def self.battleship
    new
  end
end
