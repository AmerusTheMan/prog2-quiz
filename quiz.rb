require_relative "question"

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
      if user_input == question.answer
        puts "Rätt"
        points += 1
        next
      else
        puts "Fel"
        next unless @allow_hint

        puts "Hint: Första bokstaven är #{question.hint}"
        if user_input == question.answer
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
  Question.new("1", "1"),
  Question.new("1", "1"),
  Question.new("1", "1"),
  Question.new("1", "1"),
  Question.new("1", "1")
], allow_hint=true)

quiz.run()