require_relative "../lib/command_line_interface.rb"
require_relative "../lib/job.rb"
require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  
  BASE_PATH = "https://www.indeed.com"

  def self.scrape_index_page(input)
    html = open(BASE_PATH + "/l-#{input}-jobs.html") # interpolate input
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
      parsed_job_post = Nokogiri::HTML(html) #parse html
      other_details = parsed_job_post.css('div.jobsearch-JobComponent')
      
      other_details.collect do |info|
      binding.pry
        details = {
          :description => info.css('div.p'),
          :location => info.css('div.icl-u-lg-block')
        }
        details
      end
  end
end