# frozen_string_literal: true
require_relative "groupon/version"
require_relative "groupon/cli"
require_relative "groupon/offer"
require_relative "groupon/scraper"
require_relative "groupon/detail"



require 'pry'
require 'nokogiri'
require 'open-uri'
require 'byebug'

module Groupon
  class Error < StandardError; end
  # Your code goes here...
end

#This is the envrionment file - this is where you make the connections and requirements