class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        response = gets.chomp
        response_arr = response.split
        response_arr.map(&:to_i)
    end
end
