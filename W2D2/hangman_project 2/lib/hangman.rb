require 'byebug'
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"] 

  # PART 1
  def self.random_word 
    DICTIONARY.sample
  end

    def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end

    def guess_word
      @guess_word
    end

    def attempted_chars
      @attempted_chars
    end

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end

    def already_attempted?(c)
      if @attempted_chars.include?(c)
        return true
      else
        return false
      end
    end

    def get_matching_indices(c) 
      arr = []
      @secret_word.each_char.with_index do |letter, i|
        if c == letter
          arr << i
        end
      end
      arr
    end

    def fill_indices(c, arr)
      arr.each do |i|
        @guess_word[i] = c
      end
      @guess_word
    end

    # PART 2
    def try_guess(c)
      if already_attempted?(c)
        puts 'that has already been attempted'
        return false
      end
      
      @attempted_chars << c
      indices = get_matching_indices(c)
      
      if indices.length == 0
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(c, indices)
      end
      
      true
    end

    def ask_user_for_guess
      puts 'Enter a char:'
      response = gets.chomp
      try_guess(response)
    end

    def win?
      if @guess_word.join == @secret_word
        puts 'WIN'
        return true
      else
        return false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        puts 'LOSE'
        return true
      else
        return false
      end
    end

    def game_over?
      if win? || lose?
        puts @secret_word
        return true
      else
        return false
      end
    end
    
end