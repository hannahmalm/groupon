class Groupon::CLI 
    #Use this namespacing because a user might have another file called CLI so this prevents confusion
     #call the cli file from bin/chicago using Groupon::CLI.new.call
    #Use namespacing on this Module because the CLI might be named chicago elsewhere
    #.new is used to trigger the initialize method
    #if you call self in a class method it will return the class - self in the intialize method is an instance of the class

    def call 
        puts "Welcome to the Groupon finder!"
        get_offers
        list_offers
        #list_offers_details 
    end 

    def get_offers
        @offers = ["Offer 1", "Offer 2", "Offer 3"]   
    end 

    def list_offers #DONE - This will only list out the offer NAMES
        puts "Choose a offer you would like more details about"
        @offers.each.with_index(1) {|index,offer| 
            puts "#{offer} - #{index}"
        }
        #list the categories
        #use each with index to iterate over and add an index number
        #the index starts with 0 so add 1 to print out the index starting at 1
    end 


        

end 