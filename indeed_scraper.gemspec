
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "indeed_scraper/version"

Gem::Specification.new do |spec|
  spec.name          = "indeed_scraper"
  spec.version       = IndeedScraper::VERSION
  spec.authors       = ["'Sheena Bonilla'"]
  spec.email         = ["'sheena.myb@gmail.com'"]
  spec.files         = ["lib/indeed_scraper.rb"]
  spec.summary       = %q{Indeed Scraper was created to provide assistance in finding employment.}
  spec.description   = %q{Data is extracted from an external source (i.e. www.indeed.com) and displayed as the following attributes: title, location, hours/salary, job url, and a short description.}
  spec.homepage      = "https://github.com/essbee808/indeed_scraper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://rubygems.org/profiles/essbee808"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "https://github.com/essbee808/indeed_scraper.git"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["run"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "colorize", "~> 0.8.1"
  spec.add_dependency "nokogiri"

end
