require "minitest/autorun"
require_relative "../self_graded.rb"

class SelfGradedTest < Minitest::Test
  
  def test_j_is_correct_n_is_false
    q = SelfGraded.new("prompten", "svar")
    assert q.correct?("j")
    refure q.correct?("n")
  end

end