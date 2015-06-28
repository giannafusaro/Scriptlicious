require 'io/console'

module Dictionary

  @dictionary = IO.readlines('/usr/share/dict/web2').each{|l| l.chomp!}


  def exists word
    @dictionary.index(word)
  end


end
