


def anagram(word)
  if word.length>1
    results = [word[0..1], swap(word[0..1], 0, 1)]

    (2..(word.length-1)).each do |i|
      results = next_permutation(results, word[i])
    end
    results
  else
    word
  end
end


def swap(word, index1, index2)
  swapped = ""

  unless word.length<2 || index1==index2
    swapped += index1==0 ? word[index2] : word[0..(index1-1)] + word[index2]

    swapped += word.slice((index1+1)..(index2-1)) + word[index1]

    swapped += index2==(word.length-1) ? "" : word.slice((index2+1)..(word.length-1))
  end

end

def next_permutation(previous, char)
  results = []

  previous.each do |word|
    new_word = word + char
    results << new_word
    (0..(new_word.length-2)).each do |i|
      puts "#{i}"
      results << swap(new_word, i, (new_word.length-1))
      puts "#{results}"
      results
    end
  end
  puts "///////////////////////////////////////////////////////////////////////////////////////"
  results
end

def factorial(number)
  temp = 0
  number==1 ? 1 : temp = number * factorial(number-1)
end


ARGV.each do |argument|
  output = anagram(argument)
  puts "#{output}"
  puts "correct number of anagrams #{factorial(argument.length)}"
  puts "number of anagrams returned by function #{output.length}"
end
