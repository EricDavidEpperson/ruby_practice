require 'pry'

class BowlingScore

  def initialize(score)
    @rolls = score
  end

  def game_score
    score = @rolls.inject(:+)
  end
end
