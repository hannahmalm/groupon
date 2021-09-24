class Groupon::Scraper 
    def self.scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))

        offers = doc.css(".grpn-dc-title")

        offers.each do |t|
            title = t.text 
            Groupon::Offer.new(title)
        end 
    end 
end 