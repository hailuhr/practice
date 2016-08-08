require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

    # attr_accessor :parse_page

    # BASE_URL = "http://store.nike.com/us/en_us/pw/womens-lifestyle-shoes/7ptZoneZoi3?ipp=120"

    # def initialize
    #   doc = Nokogiri::HTML(open("http://store.nike.com/us/en_us/pw/womens-lifestyle-shoes/7ptZoneZoi3?ipp=120"))
    #
    # end


    def scrape_names(url)
      # doc = Nokogiri::HTML(open("http://store.nike.com/us/en_us/pw/womens-lifestyle-shoes/7ptZoneZoi3?ipp=120"))
      doc = Nokogiri::HTML(open(url))
      name_list = doc.css(".product-name p").children.map{ |name| name.text }.compact
      no_repeats = []
      name_list.each_with_index { |name, i|  no_repeats << name if i.even? }
      twenty_names = no_repeats[1..10]
    end

    def scrape_prices(url)
      # doc = Nokogiri::HTML(open("http://store.nike.com/us/en_us/pw/womens-lifestyle-shoes/7ptZoneZoi3?ipp=120"))
      doc = Nokogiri::HTML(open(url))
      prices = doc.css(".product-price span.local").children.map{ |price| price.text }.compact

      twenty_prices = prices[1..10]
    end

    def shoe_names_and_prices(url)

      shoes = []
      scrape_names(url).each_with_index do |name, i|
        shoe_hash = {}
        shoe_hash[:number] = i.to_i + 1
        shoe_hash[:name] = name
        shoe_hash[:price] = scrape_prices(url)[i.to_i]
        # binding.pry

        shoes << shoe_hash
      end

      shoes
      # binding.pry
    end

    def list(url)
      shoe_names_and_prices(url).each do |shoe|

        puts "#{shoe[:number]} #{shoe[:name]} #{shoe[:price]}"
      end
      # binding.pry
    end

end
