require_relative "answer"

class Blanket
  attr_reader :answer
  attr_accessor :guessed_letters, :missed, :lives, :won

  def initialize(lives = 0)
    @answer = Answer.new
    @guessed_letters = []
    @missed = []
    @lives = lives
    @won = false
  end

  def size
    @answer.size
  end

  def show
    blanket = ("-"*size).chars
    blanket = make(blanket)
    blanket.join
  end

  def lives_left
    @lives-@missed.count
  end

  def open
    @answer.show_answer
  end

  def show_missed
    @missed.join(", ")
  end

  def make(blanket)
    return blanket if @guessed_letters.empty?
    @guessed_letters.flatten(1).each{|pair|
      blanket[pair[1]] = pair[0]
    }
    blanket
  end

  def game_finished?
    return true if @won
    return true if size == @guessed_letters.count
    return true if lives_left < 1
    false
  end

  def question(letter)
    if letter.chars.count > 1
      word_guessed(letter) 
      return
    end
    letter_guessed(letter)
  end

  def letter_guessed(letter)
    answer = @answer.includes(letter)
    @missed << letter if answer.empty? 
    guessed_correct(answer) unless answer.empty?
  end

  def guessed_correct(answer)
    if answer.flatten.count > 2
      answer.each{ |unit|
        @guessed_letters << [unit]
      }
    else
      @guessed_letters << answer
    end
  end

  def word_guessed(word)
    if @answer.final?(word)
      @won = true
    else
      @missed << word
    end
  end

end