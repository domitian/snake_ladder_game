require 'pp'

class GameBoard

    attr_reader :grid
    attr_reader :gridsize
    attr_reader :snakes
    attr_reader :ladders
    def initialize(gridsize)
        @gridsize = gridsize
        @grid = (0..(gridsize*gridsize)).to_a
        set_snakes_and_ladders
    end

    def print_board
        dup_grid = @grid.dup
        dup_grid.shift
        @snakes.each do |k,v|
            dup_grid[k] = "\e[31mS\e[0m"
            puts "Snake locations and their destinations are [#{k},#{v}]"
        end
        @ladders.each do |k,v|
            dup_grid[k] = "\e[32mL\e[0m"
            puts "Ladder locations and their destinations are [#{k},#{v}]"
        end
        dup_grid.reverse.each_slice(gridsize).with_index do |row,index|
            if index.odd?
                row = row.reverse
            end
            puts row.join(' ')  
        end
    end

    def location_is_valid square_number
        !@grid[square_number].nil?
    end

    def location_is_last square_number
        @grid[square_number] == gridsize*gridsize
    end

    def location_is_a_snake square_number
        if @snakes[square_number]
            puts "ooohh, you got swallowed by a snake"
        end
        @snakes[square_number]
    end

    def location_is_a_ladder square_number
        if @ladders[square_number]
            puts "lucky!, you moved up"
        end
        @ladders[square_number]
    end



    private

    def set_snakes_and_ladders
        #for now setting as constant locations
        @snakes = {}
        @ladders = {}
        @snakes = {
            2 => 1,
            55 => 20,
            24 => 12,
            9  => 3,
            90 => 45
        }
        @ladders = {
            3 => 4,
            4 => 100,
            10 => 49,
            22 => 66,
            30 => 99
        }
    end

end

