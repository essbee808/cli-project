require_relative "../lib/scraper.rb"
require_relative "../lib/command_line_interface.rb"
require 'pry'

class Job
  attr_accessor :title, :company, :wage, :job_url
  
  @@all = []
  
  def initialize(job_hash)
    job_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  def self.create_from_collection(job_array)
    job_array.each do |el|
      new_job = self.new(el)
      new_job
    end
  end
  
  def add_job_attributes(attributes_hash)
    #iterate over attributes_hash
      #use metaprogramming; assign student attributes and values using send method
      attributes_hash.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.all
    @@all
  end
  
end