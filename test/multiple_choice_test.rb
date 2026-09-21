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
    q = MultipleChoice.new("huvudstad i norge?", "Oslo", ["Oslo", "Annat"])
    assert_equal "O", q.hint
  end

  def test_hint_for_another_question
    q = MultipleChoice.new("Vad heter huvudstaden i Sverige?", "Stockholm", ["Oslo", "Stockholm"])
    assert_equal "S", q.hint
  end

  def test_correct_ignore_case
    q = MultipleChoice.new("Vad heter huvudstaden i Norge?", "Oslo", ["Oslo", "Annat"])
    assert q.correct?("1")
    refute q.correct?("2")
  end

  def test_refuses_empty_prompt
    assert_raises(ArgumentError) { MultipleChoice.new("", "Oslo", ["some", "alts"]) }
  end

  def test_refuses_empty_answer
    assert_raises(ArgumentError) { MultipleChoice.new("prompts", "", ["", "alts"]) }
  end

  def test_refuses_answer_not_in_alternatives
    assert_raises(ArgumentError) { MultipleChoice.new("prompts", "ans", ["not_ans", "other"]) }
  end

end