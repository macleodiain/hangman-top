class SecretWord
  attr_accessor :secret_word, :length
  def initialize(args=[])
    if args.empty?
      @secret_word = get_new_word 
    else
      @secret_word = args[0].split("")
    end
    @length = @secret_word.length
  end

  def get_new_word
    #read file in, remove the trailing newlines then filter out words that are not between 5 and 12 in length
    dictionary = File.readlines("lib/dictionary.txt").map{|word| word.chomp}.filter{ |word| word.length in 5..12}
    #returns random word from dictionary, split into an array for easier checking.
    dictionary.sample.split("")
  end

  def check(guess)
    result = Hash.new(0)
    @secret_word.each_with_index do |letter, index|
      #add to reult hash K = position(index), V = letter
      result[index] = letter if letter == guess
    end
    result
  end
end

# a = SecretWord.new()
# p a.check(gets.chomp)


