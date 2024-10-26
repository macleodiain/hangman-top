class Menu
  require_relative "lib/game"
  def initialize
        main_menu
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
      puts "Choose save file"
      files = Dir.entries("saves").reject {|f| File.directory?(f)}
      files.each do |filename|
        puts filename
      end
    
      filename = gets.chomp
      save_file = File.open("saves/#{filename}", "r").read
      Game.from_json(save_file)
      
      
      # 
    when 3
      exit
    else
      puts "Invalid entry.  Enter 1/2/3 to choose from menu"
      main_menu
    end
  end
end
Menu.new