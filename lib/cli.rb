require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'scraper.rb'


class Cli

  def run
    menu
  end


  def menu
    puts "Welcome to CLI Nike"
    puts "We have 10 shoes for you to pick from"
    puts
    Scraper.new.list
    # list

  end



end
