require "minitest/autorun"
require_relative "../multiple_choice"


# TODO
# > create test for correct? returns true if replay is answer and not just index

class Multiple_choice_test < Minitest::Test

  def test_question_has_hint
    q = MultipleChoice.new("huvudstad i norge?", ["Oslo", "Annat"], "Oslo")
    q.hint
  end


  def test_correct_ignore_case
    q = MultipleChoice.new("Vad heter huvudstaden i Norge?", ["Oslo", "Annat"], "Oslo")
    assert q.correct?("1")
    refute q.correct?("2")
  end

  def test_refuses_empty_prompt
    assert_raises(ArgumentError) { MultipleChoice.new("", ["some", "alts"], "Oslo") }
  end

  def test_refuses_empty_answer
    assert_raises(ArgumentError) { MultipleChoice.new("prompts", ["", "alts"], "") }
  end

  def test_refuses_answer_not_in_alternatives
    assert_raises(ArgumentError) { MultipleChoice.new("prompts", ["not_ans", "other"], "ans") }
  end

  def test_to_s_display_correct
    q = MultipleChoice.new("huvudstad i Norde?", ["Boslo", "some other"], "Boslo")
    assert_equal q.to_s, "huvudstad i Norde? (Boslo) [\"Boslo\", \"some other\"]"

  end

end