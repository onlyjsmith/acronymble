require 'pry'

class Search
  attr_accessor :list
  def initialize
    @unknown = []
    pick_list
  end

  def run
    words = split_words(text_input)
    unique_acronyms = find_unique_acronyms(words)
    list = search_definitions(unique_acronyms)
    print_output(list.sort)
    learn_unknown
  end

  def pick_list
    puts "Pick list 1 (TV networks) or 2 (UN bodies)"
    response = gets.chomp.to_i
    case response
      when 1
        @list = {'ABC' => 'American Broadcasting Network', 'CNN' => 'Cable News Network', 'PBS' => 'Public Broadcasting Service'}
      when 2
        @list = {'UNEP' => 'United Nations Environment Programme', 'UNDP' => 'United Nations Development Programme'}
    end
  end
    
  def text_input
    puts "Enter your text - import, upload etc"
    gets.chomp
  end

  def split_words(text)
    text.split(/[^a-zA-Z]/).each{|t| t.gsub(/\W/,'NOTHING')}
  end

  def find_unique_acronyms(words)
    acronyms = []
    words.each{|word| acronyms << word if word == word.upcase}
    acronyms
  end

  def search_definitions(acronyms) 
    definitions = {}
    acronyms.each do |a|
      if @list[a].nil?
        then definitions[a] = "Unknown"
        puts "a is " + a.to_s
        @unknown << a
      else definitions[a] = @list[a]
      end
    end
    #binding.pry
    definitions
  end

  def print_output(defs)
    puts "Definitions for you are:"
    defs.each do |d|
      puts d[0].to_s + " | " + d[1].to_s unless d[0].empty?
    end
  end

  def learn_unknown
    puts "These were not known:"
    puts @unknown
  end
end

Search.new.run
