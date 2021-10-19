class Groupon::Detail 
    # attr_accessor :location, :price, :description
    # @@all = [] 

    # def initialize(location)
    #     @location = location 
    #     @price = price 
    #     @description = description
    #     save 
    # end 

    # def self.all
    #     @@all 
    # end 

    # # def add_to_offer
    # #     @offer.details << self unless @offer.details.include?(self)
    # # end 

    # # def get_offer_details 
    # #     Groupon::Scraper.make_location(self) 
    # # end 

    # def save 
    #     @@all << self 
    # end 


    attr_accessor :title, :location, :price, :description
    
    @@all =[]

end 