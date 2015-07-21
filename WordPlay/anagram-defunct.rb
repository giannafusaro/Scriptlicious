require_relative 'Dictionary'

include Dictionary

class WordPlay

  # initialize WordPlay class for a word
  # word contains a value and an array of sub anagrams
  def initialize(word)
    @word = word
    @sub_anagrams = []
  end

  # so we don't calculate anagrams more than once
  def anagrams
    @anagrams ||= compute_anagrams
  end

  # computation of all anagrams of a word
  def compute_anagrams
    if @word.length > 1
      # initialize by adding permutations of the first two letters of word
      # into anagrams array (used each iteration when next permutation is called)
      # and store first two letters if they are valid words
      first_two = swap(@word[0..1], 0, 1)
      anagrams = [@word[0..1], first_two]
      @sub_anagrams << @word[0..1] if isvalid(@word[0..1])
      # @sub_anagrams << @word[0..1] if first_two

      # add one character to our subword, each time permuting based on the
      # previous permutation result set
      (2..(@word.length-1)).each do |i|
        anagrams = next_permutation(anagrams, @word[i])
      end
      anagrams
    else
      anagrams = @word
    end
  end

  def sub_anagrams
    @sub_anagrams
  end

  # swap two indexes of any word
  def swap(word, index1, index2)
    swapped = ""
    unless word.length<2 || index1==index2
      swapped += index1==0 ? word[index2] : word[0..(index1-1)] + word[index2]

      swapped += word.slice((index1+1)..(index2-1)) + word[index1]

      swapped += index2==(word.length-1) ? "" : word.slice((index2+1)..(word.length-1))
    else
      word
    end
  end

  # helper function for compute_anagrams that builds each permutation as
  # we add letters to build our word and its associated permutations
  # takes previous set of permutations, adds char to each subword in the set,
  # swaps the char with each letter in previous subwords, and returns the
  # new permuted set
  def next_permutation(previous, char)
    results = []

    previous.each do |word|
      new_word = word + char
      # isvalid(new_word) ?
      # results << new_word
        (0..(new_word.length-1)).each do |i|
          puts "#{new_word[i]}, i: #{i}"
          unless new_word[i] == char && i==(new_word.length-1)
            temp = swap(new_word, i, (new_word.length-1))
            puts "Swapped #{new_word}'s #{i} and #{new_word.length-1} indexes = #{temp}'"
            results << temp
            @sub_anagrams << temp if isvalid(temp)
            puts "#{results}"
          end
          results
        end
      end
    # puts "///////////////////////////////////////////////////////////////////////////////////////"
    results
  end


  def total_permutations(number=@word.length)
    temp = 0
    number==1 ? 1 : temp = number * total_permutations(number-1)
  end

  def isvalid(word)
    Dictionary.exists(word)
  end
end



ARGV.each do |argument|
  t1 = Time.now
  wordplay = WordPlay.new(argument)
  puts "#{wordplay.anagrams}"
  puts "total number of anagrams (non-unique) #{wordplay.total_permutations}"
  puts "number of anagrams returned by function #{wordplay.anagrams.length}"
  puts "number of unique anagrams#{wordplay.anagrams.uniq.length}"
  puts "number of subanagrams returned by function #{wordplay.sub_anagrams}"
  puts "this took: #{Time.now-t1} seconds!"
end
