require_relative "../lib/job.rb"
require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface
  
  def run_program
    greeting
    gets_input
    #make_jobs
  end
  
  def greeting
    puts "Hello there! Welcome to the Find A Job Command Line Interface."
    puts "Please enter your 5 digit zipcode:"
  end
  
  def gets_input
    input = gets.strip
    
    if /\d{5}/.match(input)
      puts "Great! Here are some jobs for #{input}:"
    else
      puts "I don't know what that is. Please enter your 5 digit zipcode:"
      gets_input
    end
  end

end
  
  
  
#   def make_jobs
  
#   end
  
  
  
#   def add_attributes_to_jobs
  
#   end
  
  
  
#   def display_jobs
  
#   end
  
  
# end

# Capture user's input

#prompt user to start program
  #Would you like to find a job? (Y/N)

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