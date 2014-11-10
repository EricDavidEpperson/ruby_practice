require 'pry'

class BowlingScore

  def initialize(score)
    @rolls = score
  end

  def game_score
    frame_scores
    score = @frames.flatten!.inject(:+)
  end

  private

  def strike
    @frames << @rolls.slice(0,3)
    @rolls.slice!(0)
  end

  def spare
    @frames << @rolls.slice(0,3)
    @rolls.slice!(0,2)
  end

  def frame_scores
    @frames = []
    frame = 0
    while frame < 10 do
      if @rolls[0]==10
        strike
      elsif @rolls.slice(0,2).inject(:+)==10
        spare
      else @frames << @rolls.slice!(0,2)
      end
      frame +=1
    end
  end
end
