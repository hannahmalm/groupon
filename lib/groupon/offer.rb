class Groupon::Offer 

     #List out the attributes that offers have
     attr_accessor :title, :url, :location, :price, :rating
     attr_reader :details #has_many relationship is a reader so it is not overwritten
    #start with creating class variable 
      @@all = []   

    #To initialize, you want to intialzie an instance
    #create an empty array that holds all of the details within the offer
    def initialize(attributes) #pass in attributes from the hash
        @title = attributes[:title]
        @url = attributes[:url]
        @location = attributes[:location]
        @price = attributes[:price]
        @rating = attributes[:rating]
        @details = []
        self.save 
       # @@all << self #save or remember the object
    end 

    def save 
        @@all << self
    end 

    def self.all 
        @@all 
    end 

    def add_detail(d) #add details to the offer 
        @details << d 
        d.offer = self 
    end 
end 