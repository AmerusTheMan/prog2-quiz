require "minitest/autorun"
require_relative "../question"

class QuestionTest < Minitest::Test
  def test_hint_is_first_letter_of_answer
    q = Question.new("huvudstad i norge?", "Oslo")
    assert_equal "O", q.hint
  end

  def test_hint_for_another_question
    q = Question.new("Vad heter huvudstaden i Sverige?", "Stockholm")
    assert_equal "S", q.hint
  end

  def test_correct_ignore_case
    q = Question.new("Vad heter huvudstaden i Norge?", "Oslo")
    assert q.correct?("oslo")
    refute q.correct?("Bergen")
  end

  def test_refuses_empty_prompt
    assert_raises(ArgumentError) { Question.new("", "Oslo") }
  end

  def test_to_s_display_correct
    q = Question.new("huvudstad i Norde?", "Boslo")
    assert_equal q.to_s, "huvudstad i Norde? (Boslo)"

  end
end