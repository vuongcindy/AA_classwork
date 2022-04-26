require_relative "room"
require 'byebug'

class Hotel
  def initialize(name, room_name_capacity)
    @name = name
    #hash keys are room names from hash arg, values are room instances with specified capacities
    # @rooms = Hash.new { |h, k| h[k] = [] }
    @rooms = {}
    room_name_capacity.each do |k, v|
        @rooms[k] = Room.new(v)
    end
  end

  def name 
    capitalized_name = []
    name_parts = @name.split # arr of name parts
    name_parts.each do |word|
        capitalized_name << word.capitalize!
    end
    capitalized_name.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    rooms.has_key?(name)
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
      if rooms[room_name].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    rooms.each do |room_name, max_capacity|
      if max_capacity.available_space > 0
        return true
      end
    end
    false
  end

  def list_rooms
    rooms.each do |room_name, max_capacity|
      # debugger
      puts "#{room_name} : #{max_capacity.available_space}"
    end
  end

end
