class Game
  require_relative "secret_word.rb"
  def initialize(args = [])
    if args.empty?
      #start game as normal
      @secret_word = SecretWord.new()
      p @secret_word.secret_word
      @lives = 11
      @previous_guesses = []
      @known_letters = Array.new(@secret_word.length, "_")
    else
      #load game from args
    end
    run_game
  end

  def run_game
    while true
    #get the users guess
      guess = get_guess
      @previous_guesses << guess
      puts `clear`
    #get any matching letters in a hash
      result = @secret_word.check(guess)
    #if no matching letters, lives -1
      @lives -=1 if result.empty?
      update_known_letters(result)
      print_results(guess)
      check_for_win
    end
  end

  def get_guess
    puts "Please enter you guess:"
    guess = gets.chomp.downcase
    if guess == "SAVE" 
      #run save method
    end
    #check single character and in range a..z
    if guess.length == 1 && guess in "a".."z"
      return guess
    else
      puts "Invalid Guess.  Guess must be a single character in A..Z"
      get_guess
    end 
  end

  def update_known_letters(result)
    result.each do |pos, letter|
      @known_letters[pos] = letter
    end
  end

  def print_results(guess)
    print "Previous guesses:"
    @previous_guesses.each do |letter|
      print "#{letter} "
    end
    print "\n"
    puts "You guessed: #{guess}"
    @known_letters.each do |letter|
      print "#{letter} "
      sleep(0.25)
    end
    print "\n"
    puts "Lives left: #{@lives}"
  end

  def check_for_win
    if @known_letters.join == @secret_word.secret_word.join
      puts "YOU WIN :)"
      puts "Word was: #{@known_letters.join}"
      puts "Congratulations!"
      exit
    elsif @lives <=0
      puts "YOU LOSE :("
      puts "Word was: #{@known_letters.join}"
      exit
    end
  end
end#class end

a = Game.new()


