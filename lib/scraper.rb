require_relative "../lib/command_line_interface.rb"
require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  
  def get_page(input)
    html = open("https://www.indeed.com/l-#{input}-jobs.html") # interpolate input
    parsed_page = Nokogiri::HTML(html)
    #binding.pry
  end
  #need to set index_url to https://www.indeed.com/jobs?q=&l= and add zipcode at the end of url

  def self.scrape_index_page
    get_page
    all_jobs = parsed_page.css() #=> look up CSS selector for job
  end
  
end