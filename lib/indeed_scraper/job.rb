class Job
  attr_accessor :title, :company, :description, :location, :job_url, :type
  
  @@all = []
  
  def initialize(job_hash)
    job_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  def self.create_from_collection(jobs_array)
    jobs_array.each do |hash|
      new_job = self.new(hash)
      new_job
    end
  end
  
  def add_job_attributes(other_details)
      other_details.each do |key, value|
        @description = other_details[:description]
        @type = other_details[:type]
      end
  end
  
  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
  end
end
