require_relative "player"

class TurnManager
  def initialize(player)
    @current_player = player 
  end

  def take_guess
    puts "#{@current_player.name}, please input your guess: "
    guess = gets.chomp
    return guess
  end

  def generate_question
    addend1 = Random.new.rand(20)
    addend2 = Random.new.rand(20)
    return [addend1, addend2]
  end

  def display_question(addend1, addend2)
    puts "What is #{addend1} plus #{addend2}?"
  end

  def validate_guess(guess, answer)
    if guess != answer
      @current_player.lose_life
      puts "WRONG ANSWER!  #{@current_player.name} LOSES A LIFE.  YOU HAVE #{@current_player.lives} LIVES REMAINING!"
    else
      puts "CORRECT ANSWER!  #{@current_player.name} STILL HAS #{@current_player.lives} LIVES REMAINING!"
    end
  end

  def start_turn
    answer = self.generate_question
    self.display_question(answer[0], answer[1])
    guess = self.take_guess.to_i
    correct_guess = self.validate_guess(guess, answer[0] + answer[1])
  end

end