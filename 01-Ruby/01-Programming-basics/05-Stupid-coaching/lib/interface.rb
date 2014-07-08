require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.


puts "Que souhaitez-vous dire a votre coach"
ask = gets.chomp

until coach_answer(ask) == ""
  puts "Mauvaise Réponse --> Poser une nouvelle question"
  ask = gets.chomp
end