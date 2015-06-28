require_relative 'Dictionary'

include Dictionary

class WordPlay


  def initialize(word)
    @word = word
    @sub_anagrams=[]
  end

  def anagrams
    @anagrams ||= compute_anagrams
  end

  def compute_anagrams
    if @word.length>1
      first_two = swap(@word[0..1], 0, 1)
      anagrams = [@word[0..1], first_two]
      @sub_anagrams << @word[0..1] if isvalid(@word[0..1])
      @sub_anagrams << @word[0..1] if first_two
      (2..(@word.length-1)).each do |i|
        anagrams = next_permutation(anagrams, @word[i])
      end
      anagrams.uniq
    else
      anagrams = @word
    end
  end

  def sub_anagrams
    @sub_anagrams
  end

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

  def next_permutation(previous, char)
    results = []

    previous.each do |word|
      new_word = word + char
      # isvalid(new_word) ?
      # results << new_word
        (0..(new_word.length-1)).each do |i|
          # puts "#{i}"
          unless new_word[i] == char && i!=(new_word.length-1)
            temp = swap(new_word, i, (new_word.length-1))
            results << temp
            @sub_anagrams << temp if isvalid(temp)
            # puts "#{results}"

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
  puts "correct number of anagrams #{wordplay.total_permutations}"
  puts "number of anagrams returned by function #{wordplay.anagrams.length}"
  puts "number of subanagrams returned by function #{wordplay.sub_anagrams}"
  puts "this took: #{Time.now-t1} seconds!"
end
