require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.mainpage
    page = Nokogiri::HTML(open(https://flatheadbeacon.com/section/news-features/))
    news =[]
    end
    news
  end
  
  def self.scrape_detail_page
    news_details =[]
    detailpage = Nokogiri::HTML(open(https://flatheadbeacon.com/section/news-features/))
      end
    news_details
  end

end