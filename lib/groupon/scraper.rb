class Groupon::Scraper 
    def self.scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))
        
        offer_titles = doc.css(".grpn-dc-title")

        offer_titles.each do |t|
            title = t.text 
            Groupon::Offer.new(title)
        end 
    end 
end 