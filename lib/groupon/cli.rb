class Groupon::CLI 
    def call
        puts "Welcome to the Groupon finder!"
        Groupon::Scraper.scrape_offers
        list_offers
        get_user_offer_input
    end 
#---------------------------------------------------------------------------------
    def list_offers 
        puts "Choose a offer you would like more details about"
         #Could also write this as Groupon::Offer.all.each.with(index) and delete out get offers method
        #@offers.each.with_index(1) do |offer, index| 
        #get all of the offers from the Offer class
        Groupon::Offer.all.each.with_index(1) { |offer, index|
            puts "#{index} - #{offer.title}"
        }
    end 
#---------------------------------------------------------------------------------
     def get_user_offer_input #DONE
        print "\nPlease choose a number associated with an offer you would like to more information about:\n
        "
        input = gets.strip.to_i
        valid_input(input)
    end 
#--------------------------------------------------------------------------------
    def valid_input(input)
        max_value = Groupon::Offer.all.length #finding the length of the Offer array
        if input.between?(1, max_value)
            offer = Groupon::Offer.all[input-1] #subtracting 1 because the Offer array starts at 0 
            display_offer_detail(offer)
        else 
            puts "Please enter a valid input"
            get_user_offer_input
        end 
    end 
#--------------------------------------------------------------------------------
    def display_offer_detail(offer)
        puts "Offer Details for: #{offer.title} \n"
        puts "Offer Location: #{offer.location}"
        puts "Offer Price: #{offer.price}"
        puts "Offer Rating: #{offer.rating}"
        get_user_additional_input(offer)
    end 
#-------------------------------------------------------------------------------------
    def get_user_additional_input(offer)
        puts "Would you like to see the reviews for this offer? Please type Yes or No"
        input = gets.strip 

        #Create an array with all the different possibilites and include them
        
            if ["Yes", "Y","yes","y"].include?(input)
                get_review_info(offer)
            elsif ["No", "N","no","n"].include?(input)
                new_offer
            else
                puts "Please type Yes or No"
                get_user_additional_input(offer)
            end 
    end 
#---------------------------------------------------------------------------------
    def get_review_info(offer)
        Groupon::Scraper.scrape_details(offer)
        offer.details.each { |review| #iterate through each offer review 
            puts "#{review.name} says: #{review.text}.\n\n"
        }
        new_offer
    end 
#---------------------------------------------------------------------------------
    def offer_loop 
        list_offers
        get_user_offer_input
    end 
#---------------------------------------------------------------------------------
    def new_offer #DONE
            puts "Do you want to see another offer?"
            input = gets.chomp.to_s 
            if ["Yes", "Y","yes","y"].include?(input)
                offer_loop
            elsif ["No", "N","no","n"].include?(input)
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