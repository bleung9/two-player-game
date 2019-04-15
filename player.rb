class Player
  attr_reader :lives, :name
  
  def initialize(number)
    @name = "Player #{number}"
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end
end


