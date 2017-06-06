class PigLatinizer

  def piglatinize(word)
    downcase_word = word.downcase
    alpha = ('a'..'z').to_a
    vowels = %w[a e i o u]
    consonants = alpha - vowels

    if vowels.include?(downcase_word[0])
      str = word + 'way'

      str
    elsif consonants.include?(downcase_word[0]) && consonants.include?(downcase_word[1]) && consonants.include?(downcase_word[2])
      str = word[3..-1] + word[0..2] + 'ay'
    elsif consonants.include?(downcase_word[0]) && consonants.include?(downcase_word[1])
      str = word[2..-1] + word[0..1] + 'ay'
    elsif consonants.include?(downcase_word[0])
      str = word[1..-1] + word[0] + 'ay'
    else
      str = downcase_word # return unchanged
    end
  end

  def to_pig_latin(phrase)
    split_phrase = phrase.split(' ')
    array = split_phrase.map do |word|
      piglatinize(word)
    end
    array.join(" ")
  end
end
