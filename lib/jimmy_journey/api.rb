require "rubygem"
require "httparty"

require_relative 'book.rb'
require_relative 'characters.rb'
require_relative 'movies.rb'
require_relative 'quote.rb'

class Api
    attr_accessor :books, :characters, :movies, :quote

    def call
        hello
        options
    end

    def hello
        puts "Hallo! Hallo! Half a minute if you please..."
    end

    def options
        puts "What may you be wanting?"
        sleep(.5)
        puts ".5.Books or.."
        sleep(.5)
        puts "2.Characters or.."
        sleep(.5)
        puts ".5.Movies or.."
        sleep(.5)
        puts ".5.Quotes or.."
        sleep(.5)
        puts "actually, that's it!"
        userInput = gets.chomp.downcase
        list(userInput)
        options
    end

    def list(userInput)
        case userInput
        when "books" || "b" || "1"
            bookMethod
        when "characters" || "c" || "2"
            characterMethod
        when "movies" || "m" || "3"
            movieMethod
        when "quote" || "q" || "4"
            quoteMethod
        when ""
            goodbye #don't forget to make method for this (done!)
        else
            puts "I reckon you ought to try again, please select from the list or depress your return key to leave me be."
    end

    def bookMethod
        books = Books.new.book_list
        puts books
    end

    def characterMethod
        characters = Characters.new.character_list
        puts characters
    end

    def movieMethod
        movies = Movies.new.movie_list
        puts movies
    end

    def quoteMethod
        quotes = Quotes.new.quote_list
        puts quotes 
    end

    def goodbye
        puts "All's well as ends well, goodbye"
        exit
    end


end