class Player

  attr_reader :homeboard

  def initialize(homeboard: "No Board", game: "No Game")
    @homeboard = homeboard
    @game = game
  end

  def rotate(ship)
    ship.change_orientation
  end

  def place(ship, origin)
    @homeboard.place(ship, origin)
  end

  def shoot(origin)
    @game.shoot(origin) if @game.turn == self
  end





end
