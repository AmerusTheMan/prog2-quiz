require "minitest/autorun"
require_relative "../quiz"
require_relative "../question"

class QuizTest < Minitest::Test
  def test_correct_max_score
    quiz = Quiz.new
    quiz.add(Question.new("Vad heter huvudstaden i Norge?", "Oslo"))
    quiz.add(Question.new("Vad svarar 5.class?", "Integer"))
    assert_equal 2, quiz.max_score
  end
end