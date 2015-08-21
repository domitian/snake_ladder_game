require_relative 'die'
require_relative 'token'

class Player
    include Die

    attr_accessor :player_token
    def initialize
        @player_token = Token.new
    end

    def move_token_to_location square_number
        @player_token.set_location(square_number)
    end

    def get_token_location
        @player_token.location
    end

end



