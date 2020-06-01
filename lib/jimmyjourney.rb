
#all gems go here, not on each file
require "nokogiri"
require "pry"
require "open-uri"
require "httparty"
require "colorize"

require_relative './jimmyjourney/movie.rb'
require_relative './jimmyjourney/scraper.rb'
require_relative './jimmyjourney/cli.rb'
require_relative './lib/version.rb'

module JimmyJourney  
    class Error < StandardError; end 
end
