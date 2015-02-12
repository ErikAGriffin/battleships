class Game

  attr_reader :player1, :player2, :active_player

  def initialize(players: ["Player1","Player2"], ships: ["[P1 Ships]","[P2 Ships]"])
    @player1 = players.first
    @player2 = players.last
    @p1ships = ships.first
    @p2ships = ships.last
    @active_player = player1
  end

  # Unsure if other classes need this access, will delete if not
  def p1ships
    @p1ships
  end

  def p2ships
    @p2ships
  end

  def switch_active_player
    @active_player = opponent
  end

  def opponent
    @active_player == @player1 ? @player2 : @player1
  end

  def opponent_ships
    @active_player == @player1 ? @p2ships : @p1ships
  end

  # !! ** !!
  # This is where you left off.
  # Checking all the opponents ships are sunk

  def game_over?
    #opponent_ships.any? !sunk?
  end

  def shoot(origin)
    shot = opponent.homeboard.shoot(origin)
    if game_over?
      return "DIRECT HIT!! Cap'n you've done it!! The enemy is defeated"
    else
    handle(shot)
    end
  end

  def handle(shot)
    case shot
      when :HIT
        "DIRECT HIT!! Well done sir!"
      when :MISS
        "Cap'n! We missed!!"
      when :DUPL
        "Blast we wasted that shot. You've already fired on that location!"
    else
      "Something has gone, terribly, terribly wrong"
    end
  end

end
