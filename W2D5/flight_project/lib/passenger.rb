require 'byebug'
class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_n)
        @flight_numbers.each do |n|
            if n == flight_n.upcase
                return true
            end
        end
        false
    end

    def add_flight(flight_n)
       if !self.has_flight?(flight_n) 
            @flight_numbers << flight_n.upcase
       end
    end
end