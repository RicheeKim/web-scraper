require 'httparty'
require 'nokogiri'
require 'byebug'


def scraper
  url = "https://blockwork.cc"
  unparsed_page = HTTParty.get(url)
end
