# frozen_string_literal: true

# This class formats the injected data
class FileFormatter
  attr_accessor :file_data, :results, :unique_results

  def initialize(file_data)
    @file_data = file_data
    @results ||= Hash.new { |h, k| h[k] = [] }
    @unique_results ||= Hash.new { |h, k| h[k] = [] }
  end

  def format_data
    file_data.each do |line|
      page, visitor_ip = line.split
      results[page] << visitor_ip unless visitor_ip.nil?
      unique_results[page] << visitor_ip unless unique_results[page].include? visitor_ip
    end
  end
end
