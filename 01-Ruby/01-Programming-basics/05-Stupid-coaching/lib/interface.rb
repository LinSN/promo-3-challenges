require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.


puts "Que souhaitez-vous dire à votre coach"
ask = gets.chomp

until coach_answer(ask) == ""
  puts coach_answer(ask)
  puts "Poser une nouvelle question"
  ask = gets.chomp
end