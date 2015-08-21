require_relative 'game'
puts "Intro Message"
puts "Snakes in board are in red color marked as S, Ladders are in green color marked as L, You have to reach 100 to win the game"

g = Game.new(2)
g.start_game
