require "CSV.rb"

class Language
  attr_reader :name
  def initialize(array)

    @name = array[0][0]
  end
end

class Database
  def initialize(languages)
    @languages = []
    languages.each do |language|
      @languages.push(Language.new(CSV.read(language)))
    end
  end
end

data = Database.new(%w[chuj.csv])

