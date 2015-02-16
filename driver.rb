require './r'


master = GameMaster.new
game = master.game
player1 = game.player1
player2 = game.player2


puts "Player 1 place ships"
puts "(To rotate a ship type 'rotate'"
game.p1ships.each_key do |ship_key|

  ship = game.p1ships[ship_key]
  while !ship.placed?
    puts "Where do you want to place your #{ship.name}?"
    coord = gets.chomp.to_sym
    if coord.downcase == :rotate
      player1.rotate(ship)
      puts ship.portrait? ? "Ship is now vertical" : "Ship is now horizontal"
    else
      player1.place(ship,coord)
    end
    if ship.placed?
      puts "Placed #{ship.name} at #{coord.to_s}"
    end
  end
end

puts "Player2 place ships"
puts "(To rotate a ship type 'rotate'"
puts "(To rotate a ship type 'rotate'"
game.p2ships.each_key do |ship_key|

  ship = game.p2ships[ship_key]
  while !ship.placed?
    puts "Where do you want to place your #{ship.name}?"
    coord = gets.chomp.to_sym
    if coord.downcase == :rotate
      player2.rotate(ship)
      puts ship.portrait? ? "Ship is now vertical" : "Ship is now horizontal"
    else
      player2.place(ship,coord)
    end
    if ship.placed?
      puts "Placed #{ship.name} at #{coord.to_s}"
    end
  end
end

## Ships are placed

#while !game.game_over?
#
#  player = game.active_player
#
#  puts "Awaiting your orders captain."
#  puts "(Where do you want to shoot?)"
#
#  coord = gets.chomp.to_sym
#  end