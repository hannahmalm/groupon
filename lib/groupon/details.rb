class Groupon::Details

    #start with creating class variable 
    @@all = []

    #List out the attributes that offers have
    #An offer has one title, locaation, price, description
    #Each detail belongs to an event
    attr_accessor :title, :location, :price, :description

    #To initialize, you want to intialzie an instance
    #create an empty array that holds all of the details within the offer
    def initialize(title)
        @title = title
        @details = []
        save 
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