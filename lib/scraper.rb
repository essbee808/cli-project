require_relative "../lib/command_line_interface.rb"
require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(input)
    html = open("https://www.indeed.com/l-#{input}-jobs.html") # interpolate input
    parsed_page = Nokogiri::HTML(html)
    all_jobs = parsed_page.css('div.jobsearch-SerpJobCard')

    all_jobs.collect do |job_card|
      job = {
        :title => job_card.css('a').attr('title').value,
        :company => job_card.css('span.company').text.strip, #remove white space
        :job_url => job_card.css('a').attr('href').value
      }
      job
    end
    end
    
  def self.scrape_job_post(job_url)
      html = open(job_url)
      parsed_page = Nokogiri::HTML(html) #parse html
      
      job_info = parsed_page.css('') # find css selector
      
      #:description => job_card.css('span')
      
  end
end