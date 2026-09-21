require_relative "question"

class TrueFalse < Question
  attr_reader :hint

  def initialize(prompt, answer, hint)
    super(prompt, answer)
    raise ArgumentError unless (answer == "true" or answer == "false")
    
    @hint = hint
  end
end