
class MultipleChoice
  attr_reader :prompt, :answer, :alternativs

  def initialize(prompt, answer, alternativs)
    raise(ArgumentError, "prompt must not be empty") if prompt.empty?
    raise(ArgumentError, "answer must not be empty") if answer.empty?
    raise(ArgumentError, "alternativs must contain answer") unless alternativs.include?(answer)
    
    @prompt = prompt
    @answer = answer
    @alternativs = alternativs
  end

  def hint
    answer[0]
  end

  def correct?(reply)
    reply = reply.to_i if reply.class != Integer
    alternativs[reply-1] == answer
  end

  def ask
    puts prompt
    alternativs.each_with_index do |alternative, index|
      puts "#{index}: #{alternative}"
    end
    gets.chomp
  end
  
end
