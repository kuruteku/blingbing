require "CSV.rb"

class Word
  def initialize(row)
    @source = row[0]
    @variants = row[1..row.length-1]
  end

  def tr_to_source(text)
    if @variants.include?(text)
    return @source
    end
  end

  def tr_to_other(text)
    if @source == text
    return @variants[0]
    end
  end

end

class Language

  attr_reader :name
  def initialize(array)
    array[0][0].strip!
    @name = array[0][0]
    @words = []
    array[1..array.length-1].each do |row|
      @words.push(Word.new(row))
    end
  end

  def tr_to_source(text)
    @words.each do |word|
      if result = word.tr_to_source(text)
      return result
      end
    end
  end

  def tr_to_other(text)
    @words.each do |word|
      if result = word.tr_to_other(text)
      return result
      end
    end
  end

end

class Database
  def initialize(languages)
    @languages = []
    languages.each do |language|
      @languages.push(Language.new(CSV.read(language)))
    end

  end

  def gay
    return @languages[0].name
  end

  def tr_to(from_language,to_language,word)
    from = nil
    to = nil   
    @languages.each do |language|
      if language.name == from_language
        from = language
      end
      if language.name == to_language
        to = language
      end
    end
    return to.tr_to_other(from.tr_to_source(word))
  end

end

penis = Database.new(%w[english.csv czech.csv])
puts penis.tr_to("english","czech","and")



