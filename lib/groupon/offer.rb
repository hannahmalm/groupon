class Groupon::Offer 

     #List out the attributes that offers have
     attr_accessor :title

    #start with creating class variable 
      @@all = []   

    #To initialize, you want to intialzie an instance
    #create an empty array that holds all of the details within the offer
    def initialize(title)
        @title = title
        #@details = []
        save 
    end 

    def self.all 
        Groupon::Scraper.scrape_offers if @@all.empty?
        @@all
    end 

    def self.location 
        doc = Nokogiri::HTML(open("https://www.groupon.com/local/things-to-do"))
        offers = doc.css(".grpn-dc-loci").first
        offers.each do |t|
        location = t.text 
        #Groupon::Detail.new(location)
        end 
    end 

    # def get_details 
    #     Groupon::Scraper.create_details_hash (self) 
    # end 

    #save the newly created objects into the array
    def save 
        @@all << self
    end 
end 