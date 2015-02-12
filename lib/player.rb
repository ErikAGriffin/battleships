class Player

  attr_reader :homeboard

  def initialize(homeboard: "No Board", game: "No Game")
    @homeboard = homeboard
    #@game = game
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)
    @homeboard.place(ship, origin)
  end

  # Does the player class have to shoot?
  # Really its the actual player, and that will be through a UI..

  def shoot(origin)
    @game.shoot(origin) if @game.active_player == self
  end





end
