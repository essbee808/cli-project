class CommandLineInterface
  
  BASE_PATH = "https://www.indeed.com"
  
  def run_program 
      make_jobs
      display_job
      make_selection
  end
  
  def greeting
    puts "Hello there! Welcome to Indeed Scraper Command Line Interface.\n\n".green
    puts "                       /\\_/\\                     ".magenta.blink
    puts "                      ( o.o )                       ".magenta.blink
    puts "                       > ^ <                       \n\n".magenta.blink
    puts "What is your name?".green
    @user_name = user_input.upcase
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

  def make_jobs
    zipcode
    user_input
    puts " "
    verify_zipcode
    jobs_array = Scraper.scrape_index_page(@input)
    Job.create_from_collection(jobs_array)  # creates an array of job objects with 5 attributes
  end
  
  def make_selection
    puts "Select a number from the list above or type 'new' to enter a new 5 digit zipcode:".green
    user_input 
    #=> conditional statement depending on user's selection
    if (@input.to_i-1) <= Job.all.size
        puts " "
        job = Job.all[@input.to_i-1]
        puts " "
        puts "TITLE: ".blue + "#{job.title}\n" if !job.title.empty?        
        puts "COMPANY: ".blue + "#{job.company}\n" if !job.company.empty?
        puts "LOCATION: ".blue + "#{job.location}\n" if !job.location.empty?
        puts "SALARY: ".blue + "#{job.salary}\n" if !job.salary.empty?
        puts "DESCRIPTION: ".blue + "#{job.description}\n" if !job.description.empty?
      menu
      @url = BASE_PATH + job.job_url
    elsif @input == "new"
      Job.clear_all
      run_program
    else
      make_selection
    end
  end

  def menu
    puts " "
    puts "What do you want to do, #{@user_name}?".green
    puts "Enter a number:\n".green
    puts "1. Learn more"
    puts "2. Go back to list"
    puts "3. Exit\n\n"

    user_input
    if @input.to_i == 1 #=> utilize #to_i to convert input to integer
      puts "Still in progress..."
    elsif @input.to_i == 2
      display_job
      make_selection
    elsif @input.to_i == 3
      puts "See you later, #{@user_name}! Good luck on your job search!".green
    else
      menu
    end
  end

  def verify_zipcode
     if /^[0-9]{5}$/.match(@input) #=> check to see that zipcode has 5 digits
      puts "Great! Here's what we found for #{@input}.".green
     else
      puts "Hmm...that doesn't look right. Enter your 5 digit zipcode:".green
      user_input
      verify_zipcode
    end
    @input
  end

  # def open_in_browser(job)
  #   system("open BASE_PATH#{{job.job_url}}")
  # end
  
  def display_job
      Job.all.each.with_index(1) do |el, index|
            puts "#{index}" + ". " + "#{el.title}\n\n"
      end
  end
end
