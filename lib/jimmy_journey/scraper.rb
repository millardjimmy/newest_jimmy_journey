require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.mainpage(url)
    page = Nokogiri::HTML(open(url))
    news =[]
    end
    news
  end
  
  def self.scrape_detail_page(url)
    news_details =[]
    detailpage = Nokogiri::HTML(open(url))
      end
    news_details
  end

end