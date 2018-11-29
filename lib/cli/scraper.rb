require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(index_url)
    html = open(index_url)
    parsed_page = Nokogiri::HTML(html)
    all_jobs = parsed_page.css() #=> look up CSS selector for job
    
  end
  
end