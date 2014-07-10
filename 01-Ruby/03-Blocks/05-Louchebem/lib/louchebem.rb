# Encoding: utf-8

def louchebemize(sentence)
    #TODO: implement your louchebem translator
  if sentence.include? " "
    sentence.split(" ").map{ |x| louchebemize_word(x)}.join(" ")
  else
    louchebemize_word(sentence)
  end
end

def louchebemize_word(sentence)
    #TODO: implement your louchebem translator
  suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]

  if sentence.size == 1
    sentence
  elsif sentence[0].downcase == 'a' || sentence[0].downcase == 'e' || sentence[0].downcase == 'i' || sentence[0].downcase == 'o' || sentence[0].downcase == 'u' ||sentence[0].downcase == 'y'
    sentence.downcase!
    sentence.insert(0, 'l').insert(sentence.size, suffix.shuffle[0])
  else
    sentence[0] = ''
    sentence.insert(0, 'l').insert(sentence.size, suffix.shuffle[0])
  end
end

puts  louchebemize("bonjour salut")
