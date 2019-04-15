require_relative "player"
require_relative "turn_manager"

class Game
  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)
  end

  def play
    current_player = @player1
    while (!self.game_over)
      puts "-----------------NEW TURN------------------"
      turn = TurnManager.new(current_player)
      turn.start_turn
      current_player == @player1 ? current_player = @player2 : current_player = @player1
    end

    puts "-----------------END OF GAME------------------"
    if @player1.lives == 0
      puts "Player 2 wins!"
    else
      puts "Player 1 wins!"
    end
  end

  def game_over
    puts "Player 1 has #{@player1.lives} lives. Player 2 has #{@player2.lives} lives."
    return @player1.lives == 0 || @player2.lives == 0
  end

end
