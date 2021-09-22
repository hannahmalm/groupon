# frozen_string_literal: true
require_relative "groupon/version"
require_relative "groupon/cli"
require_relative "groupon/offer"
require_relative "groupon/scraper"


require 'pry'

module Groupon
  class Error < StandardError; end
  # Your code goes here...
end

#This is the envrionment file 