require 'nokogiri'
require 'open-uri'
require 'pry'
require 'byebug'
class Groupon::Scraper 
    def self.scrape_offers 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))

        offers = doc.css(".grpn-dc-title")

        #as i iterate over the offers, it will print out the offer titles 
        offers.each do |t|
            title = t.text 
            #ref = t.attr("id")
            Groupon::Offer.new(title)
        end 
    end 
#-----------------------------------------------------------------------------------
   

    def get_details 
        self.get_page.css(".grpn")
    end 

    def make_details 
        self.get_details.each do |offer|
            # detail = Groupon::Detail.new
            # detail.location = offer.css(".grpn-dc-loci").text
            location = offer.css(".grpn-dc-loci").text
            Groupon::Detail.new(location)
        end 
    end 

    def print_details
        self.make_details 
        Groupon::Detail.all.each do |offer|
            puts "Location: #{offer.location}"
        end 
    end 


    def location
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))
        offers = doc.css(".grpn-dc-loci").first
        offers.each do |t|
            location = t.text 
            Groupon::Detail.new(location)
        end 
    end 

    # def print_location 
    #     self.scrape_location
    #     Groupon::Detail.all.each do |offer|
    #     puts "Location: #{offer.location}"
    #     end 
    # end 
    

     


end 

