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
        :location => job_card.css('div.location').text,
        :job_url => job_card.css('a').attr('href').value,
        :salary => job_card.css('span.salary').text.strip,
        :description => job_card.css('span.summary').text.strip
      }
      job
    end
  end
    
end
