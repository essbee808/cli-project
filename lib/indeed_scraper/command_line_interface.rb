class CommandLineInterface
  
  BASE_PATH = "https://www.indeed.com"
  
  def greeting
    puts "Hello there! Welcome to Indeed Scraper Command Line Interface.".green
    puts "What is your name?".green
    @user_name = user_input.upcase
    puts " "
    puts "Hello, #{@user_name}!".green
    @user_name
  end

  def run_program 
    make_jobs
    display_all_jobs
    make_selection(@input)
  end

  def zipcode
    puts "Enter your 5 digit zipcode:".green
  end

  def user_input
    input = gets.strip #remove white space
    @input = input
  end

  def select_number
    puts "Enter a number from the list for more info or type 'exit' to exit program:".green
    user_input
  end

  def make_jobs
    zipcode
    user_input
    puts " "
    verify_zipcode
    jobs_array = Scraper.scrape_index_page(@input)
    Job.create_from_collection(jobs_array)  # creates an array of job objects with 5 attributes
  end
  
  def make_selection(input = nil)
    if @input.to_i <= Job.all.size && @input.to_i != 0
      #retrieve job object by index number
      @job = Job.all[(@input.to_i)-1]
        puts "TITLE: ".blue + "#{@job.title}\n" if !@job.title.empty?        
        puts "COMPANY: ".blue + "#{@job.company}\n" if !@job.company.empty?
        puts "LOCATION: ".blue + "#{@job.location}\n" if !@job.location.empty?
        puts "SALARY: ".blue + "#{@job.salary}\n" if !@job.salary.empty?
        puts "DESCRIPTION: ".blue + "#{@job.description}\n" if !@job.description.empty?
      menu_list(@job.job_url)
    elsif @input.upcase == "EXIT"
      exit_program
    else
      select_number
      make_selection
    end
  end

  def menu_list(job_url)
    puts " "
    puts "What do you want to do, #{@user_name}?".green
    puts "Select a number below:\n".green
    puts "1. Learn more"
    puts "2. Go back to list"
    puts "3. Enter new zipcode"
    puts "4. Exit\n\n"

    user_input

    if @input.to_i == 1 #=> utilize #to_i to convert input to integer
      system("open", "#{BASE_PATH + @job.job_url}") #=> automatically open job posting via terminal
      menu_list
    elsif @input.to_i == 2
      display_all_jobs
      make_selection(@input)
    elsif @input.to_i == 3
      Job.clear_all
      run_program
    elsif @input.to_i == 4
      exit_program
    else
      menu_list
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
  
  def display_all_jobs
    Job.all.each.with_index(1) do |el, index|
      puts "#{index}" + ". " + "#{el.title}\n\n"
    end
    select_number
  end

  def exit_program
    puts "See you later, #{@user_name}! Good luck on your job search!".green
    puts "                       /\\_/\\                     ".magenta.blink
    puts "                      ( o.o )                       ".magenta.blink
    puts "                       > ^ <                       \n\n".magenta.blink
  end

end
