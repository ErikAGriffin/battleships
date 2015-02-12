class Game

  attr_reader :player1, :player2, :turn

  def initialize(players: ["Player1","Player2"])
    @player1 = players.first
    @player2 = players.last
    @turn = player1
  end

  def switch_turn
    @turn = opponent
  end

  def opponent
    @turn == @player1 ? @player2 : @player1
  end

  def shoot(origin)
    shot = opponent.homeboard.shoot(origin)
    handle(shot)
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
