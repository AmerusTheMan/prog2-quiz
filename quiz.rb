require_relative "question"
require_relative "multiple_choice"
require_relative "numeric_question"
require_relative "self_graded"


class Quiz
  
  def initialize(questions, allow_hint=false)
    raise ArgumentError, "questions must be a list" unless questions.class == Array
    @questions = questions
    @allow_hint = allow_hint

  end


  def run
    points = 0
    @questions.each do |question|
      user_input = question.ask
      if question.correct?(user_input)
        puts "Rätt"
        points += 1
        next
      else
        puts "Fel"
        next unless @allow_hint

        puts "Hint: Första bokstaven är #{question.hint}"
        if question.correct?(user_input)
          points += 0.5
        else
          puts "Fel"
        end

      end
    end
    
    points
  end
  
end


quiz = Quiz.new([
  Question.new("vad heter jag?", "johannes"),
  MultipleChoice.new("var bor jag?", ["tuve", "oslo", "danmark"], "tuve"),
  NumericQuestion.new("hur gammal är jag?", 18),
  SelfGraded.new("Hur tar man sig hem till mig?", "På lite olika sätt")
], allow_hint=false)

quiz.run()