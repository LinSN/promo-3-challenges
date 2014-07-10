# Encoding: utf-8

def louchebemize(sentence)
    #TODO: implement your louchebem translator
  if sentence.include?("!")
    count = sentence.count("!")
    sentence.delete!("!")
    if sentence.include? (", ")
      a = sentence.split(", ").map{ |x| louchebemize_word(x)}.join(", ")
      a << "!"*count
    elsif sentence.include? (" ")
      a = sentence.split(" ").map{ |x| louchebemize_word(x)}.join(" ")
      a << "!"*count
    else
      a = louchebemize_word(sentence)
      a << "!"*count
    end
  else
    if sentence.include? (", ")
      sentence.split(", ").map{ |x| louchebemize_word(x)}.join(", ")
    elsif sentence.include? (" ")
      sentence.split(" ").map{ |x| louchebemize_word(x)}.join(" ")
    else
      louchebemize_word(sentence)
    end
  end
end

def add_regular(sentence, reg)
  sentence.insert(sentence.size,reg)
end

def louchebemize_word(sentence)
    #TODO: implement your louchebem translator
  suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]

  if sentence.size == 1
    sentence
  elsif vowel?(sentence[0].downcase)
    sentence.downcase!
    sentence.insert(0, 'l').insert(sentence.size, suffix.shuffle[0])
  else
    caract = ''
    first_vowel = sentence.each_char do |x| # trouve la 1ere voyelle.
      if vowel?(x)
        caract = x
        break
      end
    end
    index_first_vowel = sentence.index(caract) # Indice de la 1ere voyelle
    firsts_consonant = sentence[0..index_first_vowel -1] # Selection des premieres consonnes du mots
    cut_sentence = sentence[index_first_vowel..sentence.size] # enleve les premiers consonnes
    cut_sentence.insert(cut_sentence.size, firsts_consonant).insert(0, 'l').insert(cut_sentence.size, suffix.shuffle[0])
  end
end

def vowel?(letter)
  if letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o' || letter == 'u' || letter == 'y'
    true
  else
    false
  end
end

puts  louchebemize("fou, atout, chat!!!")
