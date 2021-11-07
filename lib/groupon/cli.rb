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
    def list_offers #DONE - This will only list out the offer TITLES
        puts "Choose a offer you would like more details about"
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
        input = gets.strip.to_i
        offer = Groupon::Offer.all[input-1]
        display_offer_detail(offer)
        # max_value = Groupon::Offer.all.length 
        # if input.between?(1, max_value)
        #     offer = Groupon::Offer.all[input-1]
        #     display_offer_details(offer)
        # else 
        #     puts "Please enter a valid input"
        # end 
    end 
#---------------------------------------------------------------------------------
    # def valid_input(input, data) #FIX THIS TO ONLY OUTPUT THE NUMBERS
    #     input.to_i <= data.length && input.to_i > 0
    # end 

    # def valid_input
    #     input = gets.strip.to_i 
    #     max = Groupon::Offer.all.length 
    #     if input.between?(1,max)
    #         #This is the index - 1 (if user types in 4, its really 3)
    #         chosen_offer = Groupon::Offer.all[input-1]
    #         display_details(offer)
    #     else 
    #         puts "Please enter a valid input"
    #     end 
    # end 

    # def get_details
    #     @details = Groupon::Detail.all 
    #     #This is an instance varialbe - you will be able to use it in an instance
    #     #You would want a Class of offers rather than an array of Others
    #     #Module is called Groupon
    # end 
#--------------------------------------------------------------------------------
    def display_offer_detail(offer)
        
        Groupon::Scraper.scrape_detail(offer)
        binding.byebug
      
        offer.detail.each.with_index(1) do |detail, index|
        #details.each.with_index(1) do |detail, index|
            #print out info about each offer 
        puts "Offer Details for: #{detail.title}"
        puts "Offer Location: #{detail.location}"
        puts "Offer Price: #{detail.price}"
        puts "Offer Description: #{detail.description}"
    end 
end 


    # def list_offer_details(chosen_offer) #Logic Done
    #     offer = @offers[chosen_offer- 1]
    #     #offer.get_details
    #     puts "Offer details for: #{offer.title}"
    #     puts "Offer Location: #{offer.location}"
    #     puts "Offer Price: #{offer.price}"
    #     puts "Offer Description: #{offer.description}"
    # end 
# #---------------------------------------------------------------------------------
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