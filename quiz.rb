require_relative "question"
require_relative "multiple_choice"
require_relative "numeric_question"
require_relative "self_graded"


class Quiz
  attr_reader :length, :max_score, :questions, :allow_hint

  def initialize(questions, allow_hint=false)
    raise ArgumentError, "questions must be a list" unless questions.class == Array
    @questions = questions
    @allow_hint = allow_hint

    @length = questions.length
    @max_score = @length
  end

  def display_hint(question)
    puts "Ledtråd: #{question.hint}"
  end

  def run
    score = 0
    hint_displayed = false

    @questions.each do |question|
      user_in = question.ask
      correct = question.correct?(user_in)
      if correct
        puts "RÄTT!"
        score += hint_displayed ? 1 : 0.5

      elsif allow_hint and not hint_displayed
        puts "FEL!"
        display_hint(question)
        hint_displayed = true
        redo

      else
        puts "FEL!"
      end

      hint_displayed = false
    end

    puts "Du fick #{score}/#{max_score} poäng"
  end
end


quiz = Quiz.new([
  Question.new("vad heter jag?", "johannes"),
  MultipleChoice.new("var bor jag?", ["tuve", "oslo", "danmark"], "tuve"),
  NumericQuestion.new("hur gammal är jag?", 18),
  SelfGraded.new("Hur tar man sig hem till mig?", "På lite olika sätt")
], allow_hint=true)

quiz.run()