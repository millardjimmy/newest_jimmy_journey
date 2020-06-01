require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'

require_relative "./book"
require_relative "./scraper"
require_relative "./version"


class CLI

    def call
      Scraper.new.make_books
      start
      #list_books
      menu
    end


    def start
      puts " "
      puts " "
      puts "--------------WELCOME TO THE BOOKSHELF--------------".colorize(:red)
      puts " "
      puts " "
      puts "Please select an associated number from the coming list"
      #main_menu
      sleep(3)
      list_books
    end
  
    # def main_menu
    #     puts " "
    #     puts "Which list would you like to see?"
    #     puts " "
    #     puts "1. ".colorize(:light_blue) + "Fiction"
    #     puts "2. ".colorize(:light_blue) + "Nonfiction"
    #     input = gets.chomp
    #     input == "exit" ? goodbye : choose_list(input)
    #   end
    
      # def choose_list(input)
      #   if input == "1" || input == "nonfiction"
      #     @mode = Scraper.nonfiction
      #     list_books
      #   elsif input == "2" || input == "fiction"
      #     @mode = Scraper.fiction
      #     list_books
      #   else
      #     main_menu
      #   end
      # end
    

    def list_books
      @books = Book.all
      @books.each.with_index(1) do |book, i|
        puts "#{i}.#{book.title} - #{book.author}" 
        #puts "------------"
      end
      puts "      "
      puts "      "
    end

    def menu
      input = ""
      while input != "exit"
        puts "      "
        puts "Please, enter the associated number for the book you would like to see, or simply type 'list':".colorize(:light_blue)
        puts "      "
        puts "At any time, you may press exit to end this program".colorize(:light_blue)
        puts "      "
        input = gets.strip
      
        if input.to_i > 0 && input.to_i <= @books.length
          book = Book.find_by_index(input.to_i-1)
          puts "#{book.title} by: #{book.author}, ranked: #{book.rank}"
          puts "If you'd like to know more, type more or list to check out our list again:".colorize(:green)
        elsif input == "list"
          list_books
        elsif input == "more"
          puts "#{book.summary}"
        elsif input == "exit"
          goodbye
        else
          puts "invalid input, please type 'more', 'list' or 'exit' to end the program"
        end
      end
    end


    def goodbye
      puts "Thanks for reading! I'll be on the shelf!".colorize(:black ).colorize(:background => :white)
    end
  

end