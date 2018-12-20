class CommandLineInterface
  
  BASE_PATH = "https://www.indeed.com"
  
  def run_program
    greeting
    make_jobs
    add_other_attributes_to_job
    display_job
  end
  
  def greeting
    puts "Hello there! Welcome to Indeed Scraper Command Line Interface."
    puts "Please enter your 5 digit zipcode:"
  end

#User's input
  def user_input
      input = gets.strip #remove white space
    @input = input
  end
  
  def make_selection
    puts "Please select a number from the list above for more details or type 'more' for more jobs."
    user_input
    
    if @input.to_i.between?(1, 15)
        puts "Here are more details:"
        
        job = Job.all[@input.to_i-1]

        puts "Title: " + job.title
        puts "Description: " + job.description

        menu_list
    else
        make_selection
    end
  end

  def menu_list
    puts "What do you want to do?"
    puts "1. Apply"
    puts "2. Go back"
    puts "3. Exit"

    user_input
    # binding.pry
    if @input.to_i == 1
      job = Job.all[@input.to_i-1]
      puts "Right click on the link below to apply!"
      puts BASE_PATH + job.job_url
      menu_list
    elsif @input.to_i == 2
      display_job
    elsif @input.to_i == 3
      puts "See you later!"
    else
      menu_list
    end
  end

  def verify_zipcode
     if /^[0-9]{5}$/.match(@input)
      puts "Great! Here are some awesome jobs that we found for #{@input}: "
     else
      puts "I don't know what that is. Please enter your 5 digit zipcode:"
      user_input
    end
    @input
  end
  
  def make_jobs
    user_input
    verify_zipcode
    jobs_array = Scraper.scrape_index_page(@input)
    Job.create_from_collection(jobs_array)  # creates an array of job objects with 4 attributes
  end
  
  def add_other_attributes_to_job
    Job.all.each do |job|
      other_details = Scraper.scrape_job_post(BASE_PATH + job.job_url)
      job.add_job_attributes(other_details)
    end
  end
  
  def display_job
        Job.all.each.with_index(1) do |el, index|
            #if index <= 4 #=> displays first 5 jobs in @@all array
            puts "#{index}" + ". " + el.title + ' - ' + el.company
        end
        make_selection
  end

end
            
#display first 5 jobs
#prompt user to make a selection or type 'more' for more choices
#if user selects index 0-4
#    display details for job object
#    ask for user input
#    prompts: apply (display url) or go back?
#elsif user selects 'more'
#    pull next 5 job objects from array
#    display as 1-5?
#    ask for user input
#    prompt: make a selection or type 'more' for more choices
#else
#    loop
#end

                
#
#            else
#                puts "Select a number above to see details or type 'more' for other jobs."
#                selection = gets_input.upcase
#
#                if /^[1-5]$/.match(selection)
#                    puts "You selected number #{selection}."
#                elsif selection == 'MORE'
#                    puts "Stay tuned!"
#                else
#                    display_job
#                end
#            end


# prompt user for zipcode
  #Great! Please enter your 5 digit zipcode:

# user types zipcode

# first scrape => grabs first 15 and create job objects
#Scraper.scrape_index_page(index)

# display 5 jobs at a time

# user selects job from list to get more info

# second scrape => display everything nicely
  # attributes: type (part/full), description, wage...
  
# conditional => Still interested? Type yes or no

# give options to see next 5 jobs

# set variable equal to last index number?