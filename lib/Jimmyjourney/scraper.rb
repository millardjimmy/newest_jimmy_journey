require "pry"

class JimmyJourney::Scraper

    def self.scrape_movies
        
        site = "https://www.imdb.com/search/title/?count=10&groups=oscar_best_picture_winners&sort=year%2Cdesc&ref_=nv_ch_osc"
        doc = Nokogiri::HTML(open(site))
        movies = doc.css("#main > div > div.lister.list.detail.sub-list > div")
        movies.each do |m|
            name = m.css("h3 > a").text
            year = m.css("h3 > span.lister-item-year.text-muted.unbold").text
            

            
        JimmyJourney::Movie.new(name, year)   
        end
        
    end

end





#   puts name
#   puts year

# end