class Groupon::Offer 

    #start with creating class variable 
    @@all = []

    #List out the attributes that offers have
    attr_accessor :title, :details

    #To initialize, you want to intialzie an instance
    #create an empty array that holds all of the details within the offer
    def initialize(title)
        @title = title
        @details = []
        save 
    end 

    def self.all 
        #self.all is the same as calling Offer.all
        #use self because this is a class method 
        #scrape the offers if the array is empty
        Groupon::Scraper.scrape_offers if @@all.empty?
        @@all
    end 

    def details 
        #check to see if there are any details already, if there arent, scrape it
        #pass in self to only scrape the details of THIS instance
        Groupon::Scraper.scrape_details(self) if @details.empty?
        @details
    end 

    #save the newly created objects into the array
    def save 
        @@all << self
    end 
end 