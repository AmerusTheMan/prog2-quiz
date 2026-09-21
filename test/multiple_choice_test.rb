require "minitest/autorun"
require_relative "../multiple_choice"


# TODO
# >  DONE MultipleChoice.new(prompt, alternatives, answer). alternatives är en lista med strängar. answer är en av dem.
# >  DONE ask skriver ut frågan och alternativen numrerade från 1, och läser ett svar.
# >  DONE correct?(reply) svarar true om siffran i reply pekar på rätt alternativ. reply.to_i gör "2" till 2.
# >  DONE Samma regler som för Question: tom text säger nej. Dessutom: answer måste finnas bland alternativen, annars ArgumentError.
# >  DONE prompt, answer och alternatives går att läsa. Inget går att ändra utifrån.

class Multiple_choice_test < Minitest::Test

  def test_hint_is_first_letter_of_answer
    q = MultipleChoice.new("huvudstad i norge?", ["Oslo", "Annat"], "Oslo")
    assert_equal "O", q.hint
  end

  def test_hint_for_another_question
    q = MultipleChoice.new("Vad heter huvudstaden i Sverige?", ["Oslo", "Stockholm"], "Stockholm")
    assert_equal "S", q.hint
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