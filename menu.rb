class Menu
  require_relative "lib/game"
  def initialize
        
  end  

  def main_menu
    puts "Welcome to Hangman"
    puts "1:  Start new game"
    puts "2:  Load saved game"
    puts "3:  exit"
    case gets.chomp.to_i
    when 1
      Game.new()
    when 2
      #LOAD GAME
    when 3
      exit
    else
      puts "Invalid entry.  Enter 1/2/3 to choose from menu"
      main_menu
    end
  end
end