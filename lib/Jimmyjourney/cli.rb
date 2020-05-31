require "pry"

class Jimmyjourney::CLI
    def call
        puts "                "
        puts ">>>>---------------- ·Hello viewer!· ---------------->".colorize(:blue)
        puts "               Check out these great titles           "
        puts "                "
        getmovies
        start
    end

    def start
        print_movies
    end


    def get_movies
        movies = Jimmyjourney::Scraper.scrape_movies
    end

   def print_movies
        Jimmyjourney::Movie.all.each.with_index(1) do |movie, i|
        puts "#{index} - #{movie.name}"
   end