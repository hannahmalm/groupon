class Groupon::Offer 

     #List out the attributes that offers have
     attr_accessor :title, :location, :price, :description

    #start with creating class variable 
      @@all = []

   

    #To initialize, you want to intialzie an instance
    #create an empty array that holds all of the details within the offer
    def initialize(title)
        @title = title
        @location = location
        @price = price
        @description = description
        save 
    end 

    def self.all 
        #self.all is the same as calling Offer.all
        #use self because this is a class method 
        #scrape the offers if the array is empty
        Groupon::Scraper.scrape_offers if @@all.empty?
        @@all
    end 


    def self.location
        Groupon::Scraper.scrape_location 
        @@all
    end 

    # def self.find(id)
    #     self.all[id-1]
    # end 

    # def get_details 
    #     #check to see if there are any details already, if there arent, scrape it
    #     #pass in self to only scrape the details of THIS instance
    #     Groupon::Scraper.scrape_details(self) 
    # end 

    #save the newly created objects into the array
    def save 
        @@all << self
    end 
end 