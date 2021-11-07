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
def self.scrape_details(offer_object)
    offer_page = Nokogiri::HTML(open(offer_object.url))
        reviews = offer_page.css('.tip-item')

        reviews.each do |r| 

end 



