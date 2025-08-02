require 'open-uri'
require 'nokogiri'

def scraper(idea)
  url = "https://letsy.lewagon.com/products?search=#{idea}"
  # 1. We get the HTML page content
  html_content = URI.parse(url).read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML.parse(html_content)

  # 3. We search for the correct elements containing the items' title in our HTML doc
  doc.search('.title').map do |element|
    # 4. For each item found, we extract its title and print it
    element.text.strip
    # puts element.attribute('src')
  end
end

