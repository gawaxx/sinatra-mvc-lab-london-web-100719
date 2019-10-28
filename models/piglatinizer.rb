class PigLatinizer 

    attr_accessor :text

    def latinizer(@text)
        split_phrase
        latinize_each_word
    end 

    def initialize
        @text = text
    end

    def split_phrase 
        @word_array =  @text.split(" ")
    end 

    def start_vowel
        if @word_array[0].downcase.scan(/[aeiou]/).count == true
            return true #means it starts with a vow
        else
            return false #means it starts with a cons
        end 
    end 

    def latinize_each_word
        @new_word_array = []
        @word_array.each do |word|
            if word.start_vowel == true 
                word = word + "way"
                @new_word_array << word
            elsif word.start_vowel == false 
                split_word = word.split(/[aeoui]/)
                first_part = split_word[0]
                count = first_part.size
                ending = first_part + "ay"
                cut_word = word.slice(count...word.length)
                pig_latin_word = cut_word + ending
                @new_word_array << pig_latin_word 
            end 
        end
        sentence.join (" ")
    end

end 