require 'byebug'
class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n) {:N}}
        @size = n * n
    end

    def size
        @size
    end

    def [](arr)
        row = arr[0]
        column = arr[1]
        @grid[row][column]
    end

    def []=(position, value)
        row = position[0]
        column = position[1]
        @grid[row][column] = value
    end

    def num_ships
        count = 0
        @grid.each_with_index do |row, row_i|
            row.each_with_index do |value, column_i|
                if value == :S
                    count += 1
                end
            end
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position]=:H
            puts "you sunk my battleship"
            return true
        else
            self[position]=:X
            return false
        end
    end

    def place_random_ships
        num_of_ships = (size * 0.25).round
        ship_count = 0
        while ship_count < num_of_ships
            grid_length = Math.sqrt(size)
            row = rand(0..grid_length)
            column = rand(0..grid_length)
            position = [row, column]
            if self[position] != :S
                self[position]=:S
                ship_count += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_ships = []
        @grid.each do |sub_arr|
            subArr = []
            sub_arr.each do |value|
                if value == :S
                    subArr << :N
                else
                    subArr << value
                end
            end
            hidden_ships << subArr
        end
        hidden_ships
    end

    def self.print_grid(arr)
        arr.each do |subArr| 
            puts subArr.join(" ") 
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(hidden_ships_grid)
    end
end
