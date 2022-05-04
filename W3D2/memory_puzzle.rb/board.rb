require_relative "card.rb"
class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(4) {Array.new(4, " ")}
        @game_board = []
        @card_list = [:x, :x, :o, :o, :a, :a, :b, :b, :c, :c, :d, :d, :e, :e, :f, :f]
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def populate
        shuffled = @card_list.shuffle
        @game_board = []
        @grid.each_with_index do |row, row_i|
            game_row = []
            row.each_with_index do |val, col_i|
                if game_row.length < @grid.length
                    game_row << Card.new(shuffled.pop)
                end
            end
            @game_board << game_row
        end
        @game_board 
    end

    def render
        @game_board.each do |row|
            puts row.join(" ")
        end
    end


    def won?
        @game_board.each do |row|
            row.each do |val|
                if val == " "
                    return false
                end
            end
        end
        return true
        puts 'you won!'
        
    end


    def reveal_card(guessed_pos)
        @game_board.each_with_index do |row, row_i|
            row.each_with_index do |val, col_i|
                if row_i == guessed_pos[0] && col_i == guessed_pos[1]
                    val.reveal
                end
            end
        end
    end

    def guessed_pos
        puts "please type in two numbers separated by a space :D" # "12 34"
        gets.chomp.split(" ").map(&:to_i) #[["1", "2"],["3", "4"]]  .map { |ele| ele.to_i }
    end

end


