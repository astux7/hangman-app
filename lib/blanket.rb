require_relative "answer"

class Blanket
  attr_reader :size, :answer
  attr_accessor :guessed_letters, :missed, :lives, :guessed

  def initialize(lives = 0)
    @answer = Answer.new
    @size = @answer.size
    @guessed_letters = []
    @missed = []
    @lives = lives
    @guessed = false
  end

  def show
    print ["Word: "+show_blanket,
         show_missed,
         "Left lives: "+lives_left.to_s].join(" \n")
  end

  def show_blanket
    blanket = ("-"*@size).chars
    blanket = make(blanket)
    blanket.join
  end

  def lives_left
    @lives-@missed.count
  end

  def open
    print ["\n\nWord: "+@answer.show_answer, show_missed, "Left lives: "+lives_left.to_s].join(" \n")
  end

  def show_missed
    "Missed:" + @missed.join(", ")
  end

  def make(blanket)
    return blanket if @guessed_letters.empty?
    @guessed_letters.flatten(1).each{|pair|
      blanket[pair[1]] = pair[0]
    }
    blanket
  end

  def game_finished?
    @size == @guessed_letters.flatten(1).count || lives_left < 1 || @guessed
  end

  def question(letter)
    if letter.chars.count > 1
      word_guessed(letter) 
      return
    end
    answer = @answer.includes(letter)
    @missed << letter if answer.empty? 
    unless answer.empty?
      if answer.flatten.count > 2
        answer.each{ |unit|
          @guessed_letters << [unit]
        }
       else
         @guessed_letters << answer
      end
    end
  end

  def word_guessed(word)
    if @answer.final?(word)
      @guessed = true
    else
      @missed << word
    end
  end

end