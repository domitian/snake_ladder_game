require_relative 'player'
require_relative 'game_board'
class Game

    attr_accessor :player_list
    attr_accessor :current_player
    attr_reader :game_board

    def initialize(num_players)
        @game_board = GameBoard.new(10)
        @player_list = Array.new
        num_players.times do 
            @player_list << Player.new
        end
        @current_player = @player_list.first
    end

    def start_game
        roll_die_and_move_token
        if player_won?
            abort("Player won")
        end
        @game_board.print_board
        move_to_next_player
    end

    private

    def roll_die_and_move_token
        die_roll_result = @current_player.roll_die
        current_token_location = @current_player.get_token_location
        p current_token_location
        final_location = die_roll_result + current_token_location
        final_location = @game_board.location_is_a_snake(final_location) || @game_board.location_is_a_ladder(final_location) || final_location
        unless @game_board.location_is_valid(final_location)
            final_location = current_token_location
        end
        @current_player.move_token_to_location final_location
        puts "Your token has moved to this location #{final_location}"
    end

    def player_won?
        @game_board.location_is_last(@current_player.get_token_location)
    end

    def move_to_next_player
        player_number = (@player_list.index(@current_player) + 1) % @player_list.count
        puts "Now Player #{player_number + 1}"
        @current_player = @player_list[player_number]
    end

        
end

g = Game.new(10)
g.start_game