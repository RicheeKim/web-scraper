require 'httparty'
require 'nokogiri'
require 'byebug'


def scraper
  url = "https://blockwork.cc"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  job_listings = parsed_page.css('div.listingCard') #50 jobs

  job_listings.each do |job_listing|
    job = {
      title: job_listing.css('span.job-title').text
    }
  end

  byebug
end

scraper
