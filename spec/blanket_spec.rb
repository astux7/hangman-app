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
    @guessed_letters = []
    @missed = []
    @lives = lives
    @won = false
  end
end
describe "Blanket" do 
let(:blanket) { FakeBlanket.new}

  it 'should init with size' do
    expect(blanket.size).to eq(3)
  end 

  it 'blanket open should be 3 ---' do
    expect(blanket.show).to eq('---')
  end

  it 'blanket open should be 2 letters from 3 i-i' do
    blanket.guessed_letters = [[["i",0],["i",2]]]
    expect(blanket.show).to eq('i-i')
  end

  it 'blanket open should be 2 letters from 3 i-i' do
    blanket.guessed_letters = [[["i",0],["i",2]]]
    expect(blanket.show).to eq('i-i')
  end

  it 'should open correct quessed word' do
    expect(blanket.open).to eq("iki")    
  end
  
    it 'should open correct quessed word' do
    expect(blanket.show).to eq("---")
    
  end
  
end
