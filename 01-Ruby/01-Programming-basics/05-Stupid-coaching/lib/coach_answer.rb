def coach_answer(your_message)
  if your_message == "I am going to work right now SIR !"
    return ""
  elsif your_message.include? "?"
    "Silly question, get dressed and go to work !"
  else
    "I don't care son, get dressed and go to work !"
  end
  # TODO: return coach answer to your_message
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours !
end

