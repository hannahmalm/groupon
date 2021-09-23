class Groupon::Scraper 
    require 'nokogiri'
    require 'open-uri'
    #open uri actaully opens the webpage
    #nokogiri actually does the scraping - its the little knife that cuts it into bit sized pieces

    def scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))
        binding.pry
    end 



end 