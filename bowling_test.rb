require 'minitest/autorun'
require_relative 'bowling_score'

class BowlingScoreTest < MiniTest::Unit::TestCase

  def test_score_equals_roll
    skip
    score = BowlingScore.new(10)
    assert_equal 10, score.game_score
  end

  def test_score_euals_more_than_one_roll
    skip
    score = BowlingScore.new ([5,5])
    assert_equal 10, score.game_score
  end

  def test_score_strike
    score = BowlingScore.new ([10, 5, 5])
    assert_equal 20, score.game_score
  end

  def test_score_spare
    score = BowlingScore.new ([5,5,5])
    assert_equal 15, score.game_score
  end
  
end
