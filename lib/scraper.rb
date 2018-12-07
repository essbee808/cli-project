require_relative "../lib/command_line_interface.rb"
require 'open-uri'
require 'pry'

class Scraper
  
  def get_page
    html = open('https://www.indeed.com/jobs?q=&l=' + input)
    parsed_page = Nokogiri::HTML(html)
  end
  #need to set index_url to https://www.indeed.com/jobs?q=&l= and add zipcode at the end of url

  def self.scrape_index_page(index_url)
    html = open(index_url)
    parsed_page = Nokogiri::HTML(html)
    all_jobs = parsed_page.css() #=> look up CSS selector for job
    
  end
  
end