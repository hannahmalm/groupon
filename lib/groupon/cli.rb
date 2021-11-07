class Groupon::CLI 
    #Use this namespacing because a user might have another file called CLI so this prevents confusion
    #call the cli file from bin/chicago using Groupon::CLI.new.call
    #Use namespacing on this Module because the CLI might be named chicago elsewhere
    #.new is used to trigger the initialize method
    #if you call self in a class method it will return the class - self in the intialize method is an instance of the class

    def start
        puts "Welcome to the Groupon finder!"
        get_offers
        list_offers
        get_user_offer_input
        #display_offer_details
       # new_offer
    end 
#---------------------------------------------------------------------------------
    def get_offers
        @offers = Groupon::Offer.all 
        #This is an instance varialbe - you will be able to use it in an instance
        #You would want a Class of offers rather than an array of Others
        #Module is called Groupon
    end 
#---------------------------------------------------------------------------------
    def list_offers 
        puts "Choose a offer you would like more details about"
         #Could also write this as Groupon::Offer.all.each.with(index) and delete out get offers method
        @offers.each.with_index(1) do |offer, index| 
            puts "#{index} - #{offer.title}"
        end
        #list the offer TITLES
        #use each with index to iterate over and add an index number
        #the index starts with 0 so add 1 to print out the index starting at 1 
        #Notice the order of iteration and puts - it needs to be in this order or it wont work 
    end 
#---------------------------------------------------------------------------------
     def get_user_offer_input #DONE
        print "\nPlease choose a number associated with an offer you would like to more information about:\n
        "
        if input = gets.strip.to_i.between?(1,31)
            offer = Groupon::Offer.all[input-1]
            display_offer_detail(offer)
        else 
            puts "Please enter a valid number"
            get_user_offer_input
        end 
        # max_value = Groupon::Offer.all.length 
        # if input.between?(1, max_value)
        #     offer = Groupon::Offer.all[input-1]
        #     display_offer_detail(offer)
        # else 
        #     puts "Please enter a valid input"
            # get_user_offer_input
        # end 
    end 
#---------------------------------------------------------------------------------
  
#--------------------------------------------------------------------------------
    def display_offer_detail(offer)
        puts "Offer Details for: #{offer.title}"
        puts "Offer Location: #{offer.location}"
        puts "Offer Price: #{offer.price}"
        puts "Offer Description: #{offer.description}"
        get_user_additional_input(offer)
    end 

#-------------------------------------------------------------------------------------
    def get_user_additional_input(offer)
        puts "Would you like to see the reviews for this offer?"
        input = "nil"
        until input == "Yes" || input == "No"
            input = gets.strip 
            if input == "Yes"
                get_review_info(offer)
            else 
                new_offer 
            end 
        end 
    end 
#---------------------------------------------------------------------------------
def get_review_info(offer)
    Groupon::Scraper.scrape_details(offer)
    offer.details.each do |review| #iterate through each offer review 
        puts "#{review.name} says: #{review.text}.\n\n"
    end 
end 
#---------------------------------------------------------------------------------
    def offer_loop 
        get_offers
        list_offers
        get_user_offer_input
        new_offer
    end 
#---------------------------------------------------------------------------------
 def new_offer #DONE
        puts "Do you want to see another offer?"
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
  #rerender this as a case statement 
#---------------------------------------------------------------------------------
    def goodbye 
        puts "Thank You for using the Groupon finder!"
    end   

end 