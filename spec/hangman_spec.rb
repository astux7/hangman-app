require 'hangman'

describe "Hangman" do 
let(:hangman) { Hangman.new}

  it 'should init with players' do
    expect(hangman.lives).to be > 0
  end 


end
