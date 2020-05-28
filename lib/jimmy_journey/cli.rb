require 'colorize'
require_relative "scraper.rb"
require_relative "news.rb"

class Cli
  BASE_URL = "http://www.flatheadbeacon.com/section/news-features/"
  
  def run
    puts "Welcome to the unofficial Flathead Beacon gem!"
    sleep(1)
    make_news
    add_details_to_news
    display_news
  end

  def make_news
    news_array = Scraper.mainpage(BASE_URL)
    News.create_from_collection(news_array)
  end

  def add_details_to_news
    News.all.each do |news|
      details = Scraper.scrape_detail_page(news.link)
      news.add_details_attribute(details)
    end
  end

  def display_news
     input=""
     until input.downcase == "exit"
        puts "Latest news from the Flathead Valley".colorize(:blue)
        puts
        News.all.each do |newsitem|
        puts "#{newsitem.rank}.".rjust(3) + "  #{newsitem.headline}" #add space to right
        end
        puts ""
        print "Enter associated number for more details or type 'exit':".colorize(:light_blue)
        input = gets.strip
          if input.to_i.between?(1,10)
            display_details(input)
            puts "Press return to see the list again or type 'exit'.".colorize(:light_blue)
            input = gets.strip
          end
      end
  end

  def display_details(rank)
    newsobject = News.all.detect { |news| news.rank == rank}
    puts newsobject.headline.colorize(:green).underline
    puts
    newsobject.details.each do |detail|
    puts detail
    puts
    end
  end

end