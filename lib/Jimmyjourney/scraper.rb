require 'open-uri'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'nokogiri'
require 'colorize'

require_relative "jimmyjourney/cli"
require_relative "jimmyjourney/book"
require_relative "jimmyjourney/scraper"
require_relative "jimmyjourney/version"

class Scraper

  def get_page
    fiction_or_nonfiction = {}
    fiction_or_nonfiction[:nonfiction] = Nokogiri::HTML(open("https://thegreatestbooks.org/nonfiction"))
    fiction_or_nonfiction[:fiction] = Nokogiri::HTML(open("https://thegreatestbooks.org/"))
    return fiction_or_nonfiction
  end

  def scrape_books_index
    get_page.css("body div:nth-child(2) div div.col-sm-7 div.list-body ol li.item.pb-3.pt-3.border-bottom")
  end

  def make_books
    scrape_books_index.uniq.each do |b|
    Book.new_from_index_page(b)
    end
  end

  def scrape_summary(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('p').first.text.strip
  end
end