def most_common_words(file_name, stop_words_file_name, number_of_word)
  #TODO: return hash of occurences of number_of_word most frequent words

  stop_words = []
  File.open(stop_words_file_name).each_line do |word|
    stop_words << word.chomp
  end

  word_frequency = Hash.new(0)
  File.open(file_name, "r").each_line do |line|
    words_file = line.downcase.scan(/\b\w+\b/).delete_if{|word| stop_words.include? word}
    words_file.each{|word| word_frequency[word] += 1}
  end

  word_frequency.sort_by { |word, freq| freq }.reverse[0..number_of_word-1].to_h

end

#print most_common_words("lib/source-text.txt", "lib/stop_words.txt", 3)
