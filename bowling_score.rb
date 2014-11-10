require 'pry'

class BowlingScore

  def initialize(score)
    @rolls = score
  end

  def game_score
    if @rolls[0]==10
      strike
    end
  end

  private

  def strike
    score = @rolls.slice(0,3).inject(:+)
  end

end
