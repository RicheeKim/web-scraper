require 'HTTparty'
require 'Nokogiri'

class Scraper

  def initialize
    doc = HTTparty.get()
  end
end
