require_relative 'game.rb'
puts "Intro Message"
puts "Snakes in board are in red color marked as S, Ladders are in green color marked as L, You have to reach 100 to win the game"

num_players = ARGV[0].to_i 
if num_players == 0
    puts "Taking default player count as 2"
    num_players = 2
end
g = Game.new(num_players)
g.start_game
