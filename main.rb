@name = "BlingBing"
@version = "Alpha 1.1"



class Bing
  def initialize
    @english = %w[a the I am you are he she it is we you they are homosexual faggot fag fuck cock cocksuck diana motherfucker jerk moron stay sleep wake think mean]
    @czech = %w[nějaký ten já jsem ty jsi on ona ono je my vy oni je homosexuál buzna bukvice šuk kohout pérohul dildiana zkurvysyn kretén debil zůstat spát vzbudit myslet míním]
    @final = []

  end

  def read(sentence_e)
    sentence = sentence_e.split(' ')

    sentence.each do |element|

      if element.end_with?("ing")
        element.slice! "ing"
      end

      if element.end_with?("?")
        element.slice! "?"
      end

      if element.end_with?("!")
        element.slice! "!"
      end

      if element.end_with?(".")
        element.slice! "."
      end

      if element.end_with?(",")
        element.slice! ","
      end

      if element.end_with?("er")
        element.slice! "er"
      end


    end

    sentence.each do |element|
      index = @english.index(element)
      if index
      @final.push(@czech[index])
      else
      @final.push(element)
      end
    end

  end

  def run
    while true
      @final = []
      puts "Write a sentence in english! Using punctuation crashes the program, isn't that awesome?"
      sentence_e = gets.chomp
      sentence_e = sentence_e.downcase
      read(sentence_e)
      @final = @final.join(" ")
      puts @final
    end
  end

end

puts "Congratulations! You've actually managed to install Ruby!\nWelcome to #{@name} #{@version}!"
bing = Bing.new
bing.run
