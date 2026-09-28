require_relative "question"

class NumericQuestion
  attr_reader :prompt, :answer

  def initialize(prompt, answer)
    raise(ArgumentError, "prompt must not be empty") if prompt.empty?
    raise(ArgumentError, "answer must be numeric") unless answer.is_a?(Numeric)

    @prompt = prompt
    @answer = answer
    @answer_tolerance = 0.01
  end



  def correct?(input)
    input = input.gsub(",", ".").to_f
    (answer - input).abs <= @answer_tolerance
  end


end