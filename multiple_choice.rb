require_relative "question"


class MultipleChoice < Question
  attr_reader :alternativs

  def initialize(prompt, alternativs, answer)
    super(prompt, answer)
    raise(ArgumentError, "alternativs must contain answer") unless alternativs.include?(answer)

    @alternativs = alternativs
  end

  def correct?(reply)
    reply_int = reply.to_i if reply.class != Integer
    alternativs[reply_int-1] == answer or reply == answer
  end

  def ask
    puts prompt
    alternativs.each_with_index do |alternative, index|
      puts "#{index+1}: #{alternative}"
    end
    gets.chomp
  end

  def to_s
    "#{super} #{alternativs}"
  end
  
end
