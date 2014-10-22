require_relative './lib/hangman'

hangman=Hangman.new
 
system("clear")
puts hangman.start


while !hangman.game_finished? do 

puts "\nEnter letter"
letter = gets.chomp
puts hangman.send_question(letter)
puts hangman.stat
end
system("clear")
puts hangman.stop
puts hangman.stat