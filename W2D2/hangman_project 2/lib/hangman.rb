class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"] # all caps is class const

    # @@ class var
  # PART 1
  def self.random_word # class method
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
      c.already_attempted?
    end
end
