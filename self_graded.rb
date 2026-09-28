
class SelfGraded
  attr_reader :prompt, :answer

  def initialize(prompt, answer)
    raise(ArgumentError, "prompt must not be empyt") if prompt.empty?
    raise(ArgumentError, "answer must not be empty") if answer.empty?

    @prompt = prompt
    @answer = answer
  end


  def ask
    puts prompt
    puts "Tänk ut svaret och tryck enter"
    gets
    puts "Svar: #{answer}"
    puts "Hade du rätt?(j/n)"
    gets.chomp
  end


  def correct?(input)
    input.downcase == "j"
  end
end