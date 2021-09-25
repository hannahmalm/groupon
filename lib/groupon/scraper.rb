class Groupon::Scraper 
    def self.scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))

        offers = doc.css(".grpn-dc-title")

        #as i iterate over the offers, it will print out the offer titles 
        offers.each do |t|
            title = t.text 
            Groupon::Offer.new(title)
        end 
    end 


    def self.scrape_location
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))

        offers = doc.css(".grpn-dc-loci")

        #as i iterate over the offers, it will print out the offer titles 
        offers.each do |t|
            location = t.text 
            #Groupon::Offer.new(location)
        end 
    end 



    # def self.scrape_details(offer)
    #     doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))
    #     offer = doc.css(".grpn-dc-title")
    #     offer.location = offer.css(".grpn-dc-loci").text
    #     offer.price = offer.css(".wh-dc-price-discount").text
    #     offer.description = offer.css(".grpn-option-title").text
        
    # end 
end 