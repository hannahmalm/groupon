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
        get_user_offer_input
        new_offer
    end 

    def get_offers
        @offers = ["Offer 1", "Offer 2", "Offer 3"]   
    end 

    def list_offers #DONE - This will only list out the offer NAMES
        puts "Choose a offer you would like more details about"
        @offers.each.with_index(1) {|index,offer| 
            puts "#{offer} - #{index}"
        }
        #list the offer TITLES
        #use each with index to iterate over and add an index number
        #the index starts with 0 so add 1 to print out the index starting at 1
        
    end 

     def get_user_offer_input #DONE
        print "Please choose a number associated with an offer you would like to more information about: 
        
        "
        input = gets.to_i
            if(input >= 1 && input <=100) 
             list_offer_details
            else
                #after entering the valid number, you need to list the offer details
             puts "Please enter a valid number"
             input = gets.to_i
             list_offer_details
            end 
    end 
    
    

        
    def list_offer_details #Logic Done
        puts "Offer details for offer"
        #@activities = ["Shopping at Maceys", "Running Club", "Justin Bieber concert"]
       # Chicago::Activity.all.each.with_index
        # @activities.each.with_index(1) {|index, activity|
        #     puts "#{activity} - #{index}"
        # }
   
        #puts "Activty Name: SCRAPER DATA"
    #     puts "Activity Description: SCRAPER DATA"
    #     puts "Activity URL: SCRAPER DATA"
    #     new_activty
    
    end 

    def offer_loop 
        get_offers
        list_offers
        get_user_offer_input
        new_offer
    end 

    def new_offer 
        puts "Do you want to see another offer? Please enter Yes or No"
        input = gets.chomp.to_s 
        if input == "Y" || input == "Yes" || input == "y" || input == "yes"
            offer_loop
        elsif input == "N" || input == "No" || input == "n" || input == "no"
            goodbye 
        else 
           puts "Please enter Yes or No"
            input_new = gets.chomp.to_s 
            if input_new == "Yes"
                offer_loop
            else 
                goodbye
            end
        end

    end 

    def goodbye 
        puts "Thank You for using the Groupon finder!"
    end   

end 