class Groupon::Offer 

    #start with creating class variable 
    @@all = []

    #List out the attributes that offers have
    attr_accessor :title

    #To initialize, you want to intialzie an instance
    def initialize(title)
        @title = title
        save 
    end 

    def self.all 
        #use self because this is a class method 
        #scrape the offers if the array is empty
        Groupon::Scraper.scrape_offers if @@all.empty?
        @@all
    end 

    #save the newly created objects into the array
    def save 
        @@all << self
    end 
end 