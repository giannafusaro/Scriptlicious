


def anagram(word)
  initial = []
  results = []
  if word.length>1
    initial << swap(word[0..1], 0, 1)
    initial << word[0..1]

    (2..(word.length-1)).each do |i|
      # puts "///////////////////////////////////////////////////////////////"
      # puts "anagram called i=#{i} and results: " + results.inspect
      if i==2
        results = next_permutation(initial, word[i])
      else
        results = next_permutation(results, word[i])
      end
    end
    results
  else
    word
  end
end


def swap(word, index1, index2)
  swapped = ""

  unless word.length<2 || index1==index2
    if index1==0
      swapped += word[index2]
    else
      swapped += word.slice(0..(index1-1)) + word[index2]
    end
    swapped += word.slice((index1+1)..(index2-1)) + word[index1]
    if index2==(word.length-1)
      swapped
    else
      swapped += word.slice((index2+1)..(word.length-1))
    end
    swapped

  end

end

def next_permutation(previous, char)
  results = []
  # puts "char " + char
  # puts "next_permutation previous at start" + previous.inspect
  previous.each do |word|
    new_word = word + char
    results << new_word
    (0..(new_word.length-2)).each do |i|
      results << swap(new_word, i, (new_word.length-1))
      # puts "next_permutation i=#{i}, swap position #{i} with position #{new_word.length-1} in #{new_word}: " + results.inspect

    end
  end
  # puts "next_permutation results at end" + results.inspect
  results
end

def factorial(number)
  temp = 0
  if number==1
    1
  else
    temp = number * factorial(number-1)
    temp
  end
end

# puts "kasc " + swap("cask", 0, 3)
# puts "acsk " + swap("cask", 0, 1)
# puts "caks " + swap("cask", 2, 3)

output = anagram("angelo")
my_num_anagrams = (output.length)
correct_num_anagrams = factorial("angelo".length)
puts "correct_num_anagrams: #{correct_num_anagrams}"
puts "my_num_anagrams: #{my_num_anagrams}"
puts output.inspect
