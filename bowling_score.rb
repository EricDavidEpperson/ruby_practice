require 'pry'

class BowlingScore

  def initialize(score)
    @rolls = score
  end

  def game_score
    if @rolls[0]==10
      strike
    else @rolls.slice(0,2).inject(:+) == 10
      spare
    end
  end

  private

  def strike
    score = @rolls.slice(0,3).inject(:+)
  end

  def spare
    score = @rolls.slice(0,3).inject(:+)
  end
end
