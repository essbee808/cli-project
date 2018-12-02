require_relative "../lib/job.rb"
require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface
  puts "Hello there! Welcome to Operation: Find A Job."
  puts "Please enter your 5 digit zipcode:"
  input = gets.strip
  
end
  
#   def run
#     greeting
#     make_jobs
#   end
  
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