require 'httparty'
require 'nokogiri'
require 'byebug'


def scraper
  url = "https://blockwork.cc"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  job_listings = parsed_page.css('div.listingCard') #50 jobs
  page = 1
  per_page = job_listings.count #50
  total = parsed_page.css('div.job-count').text.split(' ')[1].gsub(',','').to_i #total pages
  last_page = (total.to_f / per_page.to_f).round
  jobs = []

  while page <= last_page
    pagination_url = "https://blockwork.cc/listings?page=#{page}"
    pagination_unparsed_page = HTTParty.get(pagination_url)
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)

    job_listings.each do |job_listing|
      job = {
        title: job_listing.css('span.job-title').text,
        company: job_listing.css('span.company').text,
        location: job_listing.css('span.location').text,
        url: "https://blockwork.cc" + job_listing.css('a')[0].attributes["href"].value
      }

      jobs << job
    end
  end
  byebug
end

scraper
