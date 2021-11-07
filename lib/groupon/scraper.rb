require 'nokogiri'
require 'open-uri'
require 'pry'
require 'byebug'
class Groupon::Scraper 
    def self.scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local"))

        offers = doc.css(".grpn-dc-title")

        #as i iterate over the offers, it will print out the offer titles 
        offers.each do |t|
            title = t.text 
            #ref = t.attr("id")
            Groupon::Offer.new(title)
        end 
    end 

#-----------------------------------------------------------------------------------
def self.scrape_detail(offer)
    doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))
    doc.each do |offer|
        #create an instance
        detail = Groupon::Detail.new(detail) #has_many relationship
        details = []
        #assign object attribues
        detail.title = offer.css(".grpn-dc-title").text
        detail.location = offer.css(".grpn-dc-loci").text
        detail.price = offer.css(".wh-dc-price-discount").text
        detail.description = offer.css(".grpn-option-title").text

       #Associate details with the offer
        offer.add_detail(detail)
        offer.detail << detail
        #details << detail.location, detail.price, detail.description
    end
end 

end 



