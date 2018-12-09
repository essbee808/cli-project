require_relative "../lib/command_line_interface.rb"
require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(input)
    html = open("https://www.indeed.com/l-#{input}-jobs.html") # interpolate input
    parsed_page = Nokogiri::HTML(html)
    all_jobs = parsed_page.css('div.jobsearch-SerpJobCard')
    all_jobs
  
       
    # all_jobs.collect do |job_card|
      
    #   job = {
    #     :title = job_card.css('a.jobtitle').text,
    #     # :company
    #     # :wage
    #     # :url
    #   }
    #   job
    
  end
  
end