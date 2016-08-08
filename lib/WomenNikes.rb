require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'scraper.rb'

class WomenNikes

  @@all = []

  def initialize(shoe_hash)

    shoe_hash.each{ |k, v| send("#{k}=", v) }

    @@all << self
    binding.pry
  end

  def create_from_collection(shoe_hash)
    shoe_hash.each do |shoe_details|
      self.new(shoe_details)
    end
    binding.pry
  end

end


# WomenNikes.new(Scraper.new.shoe_names_and_prices)
# WomenNikes.create_from_collection(Scraper.new.shoe_names_and_prices)
