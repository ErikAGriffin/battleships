class Driver



  # Class Methods

  def Driver.make_ships
    ship_hash = {
    aircraft_carrier: Ship.aircraft_carrier,
    battleship: Ship.battleship,
    submarine: Ship.submarine,
    destroyer: Ship.destroyer,
    patrol_boat: Ship.patrol_boat}
    ship_hash
  end
end