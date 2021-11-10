class Groupon::Offer 
     attr_accessor :title, :url, :location, :price, :rating
     attr_reader :details #has_many relationship is a reader so it is not overwritten
    
     #class variable
      @@all = []   

    #To initialize, you want to initialize an instance
    #create an empty array that holds all of the details within the offer
    def initialize(attributes) #pass in attributes from the hash
        @title = attributes[:title]
        @url = attributes[:url]
        @location = attributes[:location]
        @price = attributes[:price]
        @rating = attributes[:rating]
        @details = []
        self.save 
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