require_relative 'Dictionary'

include Dictionary

def swap(word, index1, index2)
  temp_word = word.dup
  temp = temp_word[index1]
  temp_word[index1] = temp_word[index2]
  temp_word[index2] = temp
  return temp_word
end

def permute(word, curr_index, results, dict_results)
  if(curr_index == (word.length))
    results << word
    dict_results << word if isvalid(word)
  else
    for i in curr_index..word.length-1
      # swap(word, curr_index, i)
      permute(swap(word, curr_index, i), curr_index+1, results, dict_results)
    end
  end
end

def isvalid(word)
  Dictionary.exists(word)
end

ARGV.each do |argument|
  t1 = Time.now
  result_set = []
  dict_result_set = []
  permute(argument, 0, result_set, dict_result_set)
  puts "anagrams of #{argument}: #{result_set.uniq}"
  puts "valid anagrams of #{argument}:  #{dict_result_set.uniq}"
  puts "this took: #{Time.now-t1} seconds!"
  # puts "total number of anagrams (non-unique) #{result_set}"
  # puts "number of anagrams returned by function #{result_set.}"
end
