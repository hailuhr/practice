require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'scraper.rb'


class Cli

  BASE_URL = "http://store.nike.com/us/en_us/pw/womens-lifestyle-shoes/7ptZoneZoi3?ipp=120"
  def run
    menu
  end


  def menu
    puts "Welcome to CLI Nike"

    puts "We have 10 shoes for you to pick from"
    puts

    count = 0
    Scraper.new.shoe_names_and_prices(BASE_URL).each do |el|
      puts "#{count += 1} #{el[:name]}  #{el[:price]}"
    end

    # Scraper.new(BASE_URL).list
  end




end
