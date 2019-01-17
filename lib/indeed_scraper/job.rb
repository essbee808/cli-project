class Job
  attr_accessor :title, :company, :description, :location, :job_url, :salary
  
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
  
  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
  end
end
