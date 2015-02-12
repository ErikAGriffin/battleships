class Game

  attr_reader :player1, :player2, :turn

  def initialize(players: ["Player1","Player2"])
    @player1 = players.first
    @player2 = players.last
    @turn = player1
  end

  def opponent
    @turn == @player1 ? @player2 : @player1
  end

  def shoot(origin)

  end

end
