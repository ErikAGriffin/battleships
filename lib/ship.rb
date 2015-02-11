class Ship

  attr_reader :size, :hits

  def initialize(size = 3)
    @size = size
    @hits = 0
  end

  def hit
    @hits += 1
  end

  def sunk?
    @hits >= @size
  end

  # Class Methods

  def Ship.aircraft_carrier
    new 5
  end

  def Ship.battleship
    new 4
  end

  def Ship.submarine
    new 3
  end

  def Ship.destroyer
    new 3
  end

  def Ship.patrol_boat
    new 2
  end




end