class Groupon::Offer 

     #List out the attributes that offers have
     attr_accessor :title
     attr_reader :detail #has_many relationship is a reader so it is not overwritten
    #start with creating class variable 
      @@all = []   

    #To initialize, you want to intialzie an instance
    #create an empty array that holds all of the details within the offer
    def initialize(title)
        @title = title
        @detail = []
        @@all << self #save or remember the object
    end 

    

    def self.all 
        Groupon::Scraper.scrape_offers if @@all.empty?
        @@all
    end 

    # def self.details(detail)
    #     self.details << detail 
    #     detail.offer = self 
    # end 

    def self.add_detail(detail)
        self.detail << detail
        detail.offer = self 
    end 

    #save the newly created objects into the array
    def save 
        @@all << self
    end 
end 