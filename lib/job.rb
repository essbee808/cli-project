require_relative "../lib/scraper.rb"
require_relative "../lib/command_line_interface.rb"
require 'pry'

class Job
  attr_accessor :title, :company, :description, :location, :job_url, :type
  
  @@all = []
  
  def initialize(job_hash)
    job_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  def self.create_from_collection(jobs_array)
    jobs_array.each do |el|
      new_job = self.new(el)
      new_job
    end
  end
  
  def add_job_attributes(other_details)
    #iterate over attributes_hash
      #use metaprogramming; assign job attributes and values using send method
      other_details.each do |key, value|
        @description = other_details[:description]
        @type = other_details[:type]
      end
    @description = self.description
    @type = self.type
    puts self
  end
  
  def self.all
    @@all
  end
  
end