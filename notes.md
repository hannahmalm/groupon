1. Find scrapable website using byebug
    - Pry will not work 
2. Run "bundle gem (name)
3. Ensure it has MIT license
4. Update the Readme description
5. "pwd" into the termial to see what directory you are in 
    - Print working directory
    - "cd groupon" to change the directory
6. git status
7. git add . 
8. git commit -m 'comment'
9. git log (used to see previous gits)
10. Navigate to Git Hub
    - Create a new repo
    - Name repo
    - Choose "Public"
    - Create the Repo
11. Follow directions to push an existing repo from the command line
12. Type "./bin/groupon
    - Get the error "No Such file or directory"
13. Create bin/groupon file
    - Files within bin folder are executable file 
    - Run ./bin/groupon and get permission denied error
    - Add shebang line to bin/groupon 
        - shebang line tells the executable file to use ruby 
        - #!/usr/bin/env ruby
    - cd bin
    - ls -lah 
    - chmod +x groupon
    - ls -lah to confirm "x" executable permissions were created
    - If error still occurs cd .. to get to the main directory
14. Create a CLI file
    - In the bin file, call the CLI to start it
    - Groupon::CLI.new.call
15. In lib/groupon.rb add the "require groupon/cli"
    - KEEP THIS FILE UPDATED every time a new file is added 
16. Add any gems to gemfile/gemspec
17. Update any "to-dos" in the gemspec
















flow 
    - Print out the titles - index the titles and allow for only the numeric input 
    - User is asked which title they would like to see details about
    - User selects a number associated with titles
    - User sees groupon details 
    - CLI asks user if they want to see another groupon. Enter Y/N
        - CLI has built in error handling for if they write a wrong number
    
2. class
    2a. class relationships

Classes
    - Groupon title/details
    - CLI - "View"
    - Scraper 

