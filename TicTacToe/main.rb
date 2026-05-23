require_relative "lib/Game"

puts "Enter Player1 's Name (X):"
player1 = gets.chomp

puts "Enter Player2 's Name (O):"
player2 = gets.chomp

new_game = Game.new(player1, player2)
new_game.play