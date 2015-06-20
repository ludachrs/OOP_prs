#OOP_paper_rock_scissors.rb

# require 'pry'

class Computer
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

  def initialize
  end

  def pick
    computer_choice = CHOICES.keys.sample
    puts "Computer picks #{computer_choice}"
    computer_choice
  end

end

class Player
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

  attr_accessor :player_name
  
  def initialize
    @player_name = get_name
  end

  def pick
    begin
      puts "Pick one: (p, r, s):"
      player_choice = gets.chomp.downcase
    end until CHOICES.keys.include?(player_choice)
      puts "Player choices #{player_choice}"
      player_choice
    end

  def get_name
    puts "Hello, what is your name?"
    name = gets.chomp.capitalize
  end

end

class Game
  attr_accessor :player, :computer

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def winning_message(winning_choice)
   case winning_choice
    when 'p'
      puts "Paper wraps rock!"
    when 'r'
      puts "Rock smashes Scissors!"
    when 's'
      puts "Scisscors cuts Paper!"
    end
  end

  def run 
    pp = player.pick
    cp = computer.pick
    who_wins?(pp,cp)
    play_again
  end

  def who_wins?(pp,cp)
    if pp == cp
      puts "#{player.player_name} tied the computer."
    elsif (pp == 'p' && cp == 'r') || (pp == 'r' && cp == 's') || (pp == 's' && cp == 'p')
      winning_message(pp)
      puts "#{player.player_name} Wins!"
    else
      winning_message(cp)
      puts "The Computer Wins!"
    end
  end

  def play_again
    loop do
      puts "Do you want to play again (y/n)?"
      choice = gets.chomp.downcase
      if choice == ("y")
          run
      elsif choice == ("n")
          exit(0)
      end
    end
  end  
end


class Welcome

  def initialize
  end

  def start
    puts "Welcome to Paper Rock Scissors!"
  end
end

Welcome.new.start
game = Game.new.run

