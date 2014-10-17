require 'blanket'
require 'answer'
class FakeAnswer < Answer

  def initialize
    @word = generate_answer
  end
  def generate_answer
    "iki"
  end

end
class FakeBlanket < Blanket
  def initialize(lives = 0)
    @answer = FakeAnswer.new
    @size = @answer.size
    @guessed_letters = []
    @missed = []
    @lives = lives
  end
end
describe "Blanket" do 
let(:blanket) { FakeBlanket.new}

  it 'should init with size' do
    expect(blanket.size).to eq(3)
  end 

  it 'blanket open should be 3 ---' do
    expect(blanket.show_blanket).to eq('---')
  end

  it 'blanket open should be 2 letters from 3 i-i' do
    blanket.guessed_letters = [[["i",0],["i",2]]]
    expect(blanket.show_blanket).to eq('i-i')
  end

  it 'blanket open should be 2 letters from 3 i-i' do
    blanket.guessed_letters = [[["i",0],["i",2]]]
    expect(blanket.show_blanket).to eq('i-i')
  end

  it 'should open correct quessed word' do
    expect(blanket).to receive(:print).with("\n\nWord: iki \nMissed: \nLeft lives: 0")   
    blanket.open
  end
  
    it 'should open correct quessed word' do
    expect(blanket).to receive(:print).with("Word: --- \nMissed: \nLeft lives: 0")   
    blanket.show
  end
  
end
