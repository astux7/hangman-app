class Answer

  def initialize
    @word = generate_answer
  end

  def size
    @word.length
  end

  def final?(word_guessed)
    word_guessed == @word
  end

  def includes(letter)
    return [] unless @word.include?(letter)
    @word.chars.each_with_index.select { |char,index| 
      index if char==letter
    }
  end

  def generate_answer
    ["iki","kikimara","liaupsusas","bevardis","benamis"].sample
  end

  def show_answer
    @word
  end

  protected
  attr_reader :word

end