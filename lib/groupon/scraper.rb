require 'nokogiri'
require 'open-uri'
require 'pry'
require 'byebug'
class Groupon::Scraper 
    def self.scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local"))
        array_of_offers = doc.css(".deal-card").css('a')
        array_of_offers.each do |offer_list|
            attributes = {
                 title: offer_list.css('.grpn-dc-title')[0].children.text,
                 url: offer_list.attribute('href').value,
                 location: offer_list.css('.grpn-dc-loci').text,
                 price: offer_list.css('.wh-dc-price-discount').text,
                 rating: offer_list.css('.grpn-rating').text
             }
             offer = Groupon::Offer.new(attributes)
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



