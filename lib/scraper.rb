require 'HTTparty'
require 'Nokogiri'

class Scraper

  def initialize
    doc = HTTparty.get("https://store.nike.com/us/en_us/pw/mens-basketball-shoes/7puZ8r1Zoi3")
    @parse_page ||= Nokogiri::HTML(doc)
  end
end
