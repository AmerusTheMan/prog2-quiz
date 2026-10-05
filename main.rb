require_relative "quiz"
require_relative "question"
require_relative "multiple_choice"
require_relative "numeric_question"
require_relative "self_graded"

quiz = Quiz.new([
  Question.new("vad heter jag?", "johannes"),
  MultipleChoice.new("var bor jag?", ["tuve", "oslo", "danmark"], "tuve"),
  NumericQuestion.new("hur gammal är jag?", 18),
  SelfGraded.new("Hur tar man sig hem till mig?", "På lite olika sätt")
], allow_hint=true)

result = quiz.run()

puts "Du fick #{result}/#{quiz.max_score} poäng"