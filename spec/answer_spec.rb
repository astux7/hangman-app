require 'answer'
class FakeAnswer < Answer

  def initialize
    @word = generate_answer
  end
  def generate_answer
    "iki"
  end

end
describe "Answer" do 
let(:answer) { FakeAnswer.new}

  it 'should init with answer' do
    expect{answer.word}.to raise_error(NoMethodError)
  end 

  it 'should know the size of answer' do
    expect(answer.size).to eq(3)
  end

  it 'should return true if word guessed correct' do
    expect(answer.final?("iki")).to be true
  end

  it 'should return false if word guessed incorrect' do
    expect(answer.final?("not")).to be false
  end

  it 'should return empty array if missed the letter' do
    expect(answer.includes("o")).to eq([])
  end

  it 'should return array if guessed the letter' do
    expect(answer.includes("i")).to eq([["i",0],["i",2]])
  end
  it 'should return array if guessed the letter' do
    expect(answer.includes("k")).to eq([["k",1]])
  end
  it 'should return empty array if guessed the letter wrong' do
    expect(answer.includes("u")).to eq([])
  end

  it 'shows word if it finished game' do
    expect(answer.show_answer).to eq("iki")
  end
end
