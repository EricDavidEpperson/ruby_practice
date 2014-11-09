require 'minitest/autorun'
require_relative 'bowling_score'

class BowlingScoreTest < MiniTest::Unit::TestCase

  def test_score_equals_roll
    score = BowlingScore.new(10)
    assert_equal 10, score.game_score
  end
end
