require "minitest/autorun"
require_relative "../true_false"

class True_false_test < Minitest::Test
  def test_refuses_empty_prompt
    assert_raises(ArgumentError) { TrueFalse.new("", false, "hint") }
  end

  def test_answer_must_be_true_or_false
    TrueFalse.new("prompts", "false", "hint")
    assert_raises(ArgumentError) { TrueFalse.new("prompts", "not_false", "hint") }
    
  end

  def test_to_s_display_correct
    q = TrueFalse.new("Oslo är norges huvudstad", "true", "hint")
    assert_equal q.to_s, "Oslo är norges huvudstad (true)"

  end

  def test_correct_ignore_case
    q = TrueFalse.new("question", "true", "hint")
    assert q.correct?("true")
    refute q.correct?("false")
  end

  def test_hint_display_correct
    q = TrueFalse.new("question", "true", "en bra hint")
    assert_equal q.hint, "en bra hint"
  end

end