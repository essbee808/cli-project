require_relative "../lib/command_line_interface.rb"
require 'open-uri'
require 'pry'

class Scraper
  
  def get_page
    zipcode = CommandLineInterface.gets_input
    html = open('https://www.indeed.com/jobs?q=&l=')
    parsed_page = Nokogiri::HTML(html)
  end
  #need to set index_url to https://www.indeed.com/jobs?q=&l= and add zipcode at the end of url

  def self.scrape_index_page
    get_page
    all_jobs = parsed_page.css() #=> look up CSS selector for job
  end
  
end