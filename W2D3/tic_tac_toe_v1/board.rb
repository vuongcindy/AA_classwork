require 'byebug'
class Board
    GRID = Array.new(3) {Array.new(3, "_")} 

    def initialize
        @grid = GRID
    end

    def valid?(position)
        mark_row = position[0]
        mark_column = position[1]
        if mark_row > 2 || mark_row < 0 || mark_column > 2 || mark_column < 0
            return false
        else
            return true
        end
    end

    def empty?(position)
        mark_row = position[0]
        mark_column = position[1]
        @grid.each_with_index do |row, row_i|
            row.each_with_index do |value, column_i|
                if mark_row == row_i && mark_column == column_i
                    if value == "_"
                        return true
                    else
                        return false
                    end
                end
            end
        end
    end

    def place_mark(position, mark)
        mark_row = position[0]
        mark_column = position[1]
        if valid?(position) && empty?(position)
            @grid[mark_row][mark_column] = mark
        else
            raise "invalid input"
        end
    end

    
end