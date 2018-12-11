require_relative "../lib/job.rb"
require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface
  
  def run_program
    greeting
    make_jobs
    #display_jobs
  end
  
  def greeting
    puts "Hello there! Welcome to Indeed Scraper Command Line Interface."
    puts "Please enter your 5 digit zipcode:"
  end
  
  def gets_input
    input = gets.strip.to_s
    @input = input

    if /^[0-9]{5}$/.match(input)
      puts "Great! Here are some awesome jobs that we found for #{input}: "
     
    else
      puts "I don't know what that is. Please enter your 5 digit zipcode:"
      gets_input
    end
    @input
  end
  
  def make_jobs
    gets_input
    @jobs_array = Scraper.scrape_index_page(@input)
    Job.create_from_collection(@jobs_array)
  end
  
  def add_attributes_to_job
    Job.all.each do |job|
      attributes = Scraper.scrape_job_post(job_url)
      job.add_job_attributes(attributes)
    end
  end
  
  def display_jobs  
    
  end

end
  


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