# author: gianna fusaro

# Number 24 from Project Euler:
# A permutation is an ordered arrangement of objects.
# For example, 3124 is one possible permutation of the digits 1, 2, 3
# and 4. If all of the permutations are listed numerically or alphabetically,
# we call it lexicographic order. The lexicographic permutations
# of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits
# 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

# swap method to swap two indexes
# does not modify the caller
# returns a new word with index1 and index2 of word swapped
def swap(word, index1, index2)
  temp_word = word.dup
  temp_word[index1], temp_word[index2] = temp_word[index2], temp_word[index1]
  return temp_word
end
# permute places permutations in results array
# starts at curr_index to permute through the word
def permute(word, curr_index, results)
  if(curr_index == (word.length))
    results << word
  else
    for i in curr_index..word.length-1
      permute(swap(word, curr_index, i), curr_index+1, results)
    end
  end
end

# print 1,000,000 permutation in lexicographic order of 0123456789
nums= '0123456789'
result_set = []
permute(nums, 0, result_set)
puts result_set.sort[999999]
