require_relative './lib/hangman'

hangman=Hangman.new
 
system("clear")
hangman.start


while !hangman.game_finished? do 

puts "\nEnter letter"
letter = gets.chomp
hangman.send_question(letter)

end
system("clear")
hangman.stop