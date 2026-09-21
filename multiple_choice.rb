require_relative "question"


class MultipleChoice < Question
  attr_reader :alternativs

  def initialize(prompt, alternativs, answer)
    super(prompt, answer)
    raise(ArgumentError, "alternativs must contain answer") unless alternativs.include?(answer)

    @alternativs = alternativs
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

  def to_s
    "#{super} #{alternativs}"
  end
  
end
