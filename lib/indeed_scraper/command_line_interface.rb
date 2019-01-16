class CommandLineInterface
  
  BASE_PATH = "https://www.indeed.com"
  
  def run_program 
      make_jobs
      add_other_attributes_to_job
      display_job
  end
  
  def greeting
    puts "Hello there! Welcome to Indeed Scraper Command Line Interface.".green
    puts "What is your name?".green
    @user_name = user_input
    puts " "
    puts "Hello, #{@user_name}!".green
    @user_name
  end

  def user_input
    input = gets.strip #remove white space
    @input = input
  end

  def zipcode
    puts "Enter your 5 digit zipcode:".green
  end
  
  def make_selection
    puts "Select a number from the list above for more info or type 'back' to enter a new zipcode.".green
    user_input

  #=> conditional statement depending on user's selection
    if @input.to_i.between?(1, 15)
        puts " "
        job = Job.all[@input.to_i-1]
        puts " "
        @url = BASE_PATH + job.job_url
        puts "TITLE: ".blue + "#{job.title}\n" if !job.title.empty?        
        puts "COMPANY: ".blue + "#{job.company}\n" if !job.company.empty?
        puts "HOURS/SALARY: ".blue + "#{job.type}\n" if !job.type.empty?
        puts "LOCATION: ".blue + "#{job.location}\n\n" if !job.location.empty?
        if !job.description.empty?
          puts "DESCRIPTION: \n".blue
          puts "#{job.description}\n"
        end
        menu_list
        @url
    elsif @input == "back"
      Job.clear_all
      binding.pry
      run_program
    else
      make_selection
    end
  end

  def menu_list
    puts " "
    puts "What do you want to do, #{@user_name}?".green
    puts "Enter a number:\n".green
    puts "1. Apply"
    puts "2. Go back"
    puts "3. Exit\n\n"

    user_input
    if @input.to_i == 1 #=> utilize #to_i to convert input to integer
      puts "To apply, right click on the link below then select 'Open URL'.\n\n".green
      puts @url
      menu_list
    elsif @input.to_i == 2
      display_job
    elsif @input.to_i == 3
      puts "See you later, #{@user_name}! Good luck on your job search!".green
    else
      menu_list
    end
  end

  def verify_zipcode
     if /^[0-9]{5}$/.match(@input) #=> check to see that zipcode has 5 digits
      puts "Great! Here's what we found for #{@input}.".green
      puts "Loading may take a few moments, so in the meantime, please enjoy this cute cat: \n\n\n".green
      puts "                       /\\_/\\                     ".magenta.blink
      puts "                      ( o.o )                      ".magenta.blink
      puts "                       > ^ <                       \n\n\n\n".magenta.blink
     else
      puts "Hmm...that doesn't look right. Enter your 5 digit zipcode:".green
      user_input
      verify_zipcode
    end
    @input
  end
  
  def make_jobs
    zipcode
    user_input
    puts " "
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
            puts "#{index}" + ". " + "#{el.title}\n\n"
        end
        make_selection
  end
end
