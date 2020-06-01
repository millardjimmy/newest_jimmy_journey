#require "jimmyjourney/version"

module JimmyJourney
end

require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'

require_relative "jimmyjourney/cli"
require_relative "jimmyjourney/book"
require_relative "jimmyjourney/scraper"
require_relative "jimmyjourney/version"