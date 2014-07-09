require_relative 'black_jack'

def play_game
score_bank = bank_score
score_player = 0
while asking_for_card?(score_player)
  score_player += pick_card
  puts state_of_the_game(score_player, score_bank)
end
puts build_message_for(game_outcome(score_bank,score_player))





  #TODO: make the user play from terminal in a while loop that will stop when the user will not be asking for  a new card
end

def state_of_the_game(score, bank)
  "Your score is #{score}, bank is #{bank}!"
  # TODO: Returns custom message with player's score and bank's score
end

def asking_for_card?(score)
  if score <= 21
    puts "Card ? (type 'Y' or 'yes' for a new card)"
    choice = gets.chomp
      case choice
        when "yes" then return true
        when "Y" then return true
        else return false
      end
  else
      return false
  end
  # TODO: Ask for a card only if the score is less or equal to 21, then returns true or false according to the user's choice
end

def build_message_for(outcome)
  if outcome[1] > 21
     "You are over 21... you loose."
  elsif outcome[1] == 21
     "Black Jack!"
  elsif outcome[0] < outcome[1]
     "You beat the bank! You win."
  else
    "Bank beats you! You loose."
  end
  #TODO: return specific message depending on the gam e outcome (= bank's score and user's score)
end
