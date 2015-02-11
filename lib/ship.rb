class Ship

  attr_reader :size, :hits, :name

  def initialize(size = 1, name = 'dinghy')
    @size = size
    @hits = 0
    @placed = false
    @portrait_orientation = true;
    @name = name
  end

  def hit
    @hits += 1
  end

  def sunk?
    @hits >= @size
  end

  def place
    @placed = true
  end

  def placed?
    @placed
  end

  def portrait?
    @portrait_orientation
  end

  def change_orientation
    @portrait_orientation = !@portrait_orientation if !placed?
  end

  # Class Methods

  def Ship.aircraft_carrier
    new 5, 'aircraft_carrier'
  end

  def Ship.battleship
    new 4, 'battleship'
  end

  def Ship.submarine
    new 3, 'submarine'
  end

  def Ship.destroyer
    new 3, 'destroyer'
  end

  def Ship.patrol_boat
    new 2, 'patrol_boat'
  end




end