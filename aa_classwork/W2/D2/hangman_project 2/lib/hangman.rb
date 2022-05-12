class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample 
  end 

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 

  def already_attempted?(char)
    return true if attempted_chars.include?(char)
    return false if !attempted_chars.include?(char)
  end 

  def get_matching_indices(char)
    finarr = []
    @secret_word.each_char.with_index do |ele, idx|
      finarr << idx if ele == char 
    end 
    finarr 
  end 

  def fill_indices(char, arr)
    arr.each do |idx|
      guess_word[idx] = char 
    end 
  end

  def try_guess(char)
    if get_matching_indices(char) == []
      @remaining_incorrect_guesses -= 1 
    else 
      fill_indices(char, get_matching_indices(char))
    end 
    if already_attempted?(char)
      print "that has already been attempted" 
      return false 
    else
      attempted_chars << char
      return true
    end  
  end
  
  def ask_user_for_guess 
    print "Enter a char:"
    response = gets.chomp
    return try_guess(response)
  end 

  def win?
    if @secret_word == @guess_word.join("")
      p "WIN"
      return true 
    else 
      return false 
    end 
  end 

  def lose?
    if @remaining_incorrect_guesses == 0 
      p "LOSE"
      return true 
    else 
      return false 
    end
  end

  def game_over?
    if win? || lose? 
      print @secret_word
      return true 
    else 
      return false 
    end 
  end 
  
end




