require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'

require_relative "jimmyjourney/cli"
require_relative "jimmyjourney/book"
require_relative "jimmyjourney/scraper"
require_relative "jimmyjourney/version"

class Book
  attr_accessor :title, :author, :rank, :summary, :url

  @@bookshelf= []

  def initialize(title, author, rank, url)
    @title = title
    @author = author
    @rank = rank
    @url = url
    @@bookshelf << self
  end

  def self.all
    @@bookshelf.uniq
  end

  def save
    @@bookshelf << self
  end

  def self.find_by_index(index)
    @@bookshelf[index]
  end


  def self.new_from_index_page(book_html)
    name_and_author = book_html.css('h4').text.split('. ')[1].strip
    name = name_and_author.split(' by ')[0].strip
    author = name_and_author.split(' by ')[1]
    rank = book_html.css('h4').text.split('. ')[0].strip
    url = "https://thegreatestbooks.org#{book_html.css('a').first.attr('href')}"
    self.new(name, author, rank, url)
  end

  def summary
    @summary ||= Scraper.new.scrape_summary(url)
  end
end