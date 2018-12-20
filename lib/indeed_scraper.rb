#environment file
#require Gems
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

require_relative "indeed_scraper/version"
require_relative "indeed_scraper/command_line_interface"
require_relative "indeed_scraper/job"
require_relative "indeed_scraper/scraper"

#when referencing, don't need .rb