# frozen_string_literal: true

require_relative 'file_formatter'
require_relative 'output_info'
require_relative 'results_sorter'

# This module will read the file, parse the lines and show the results
class LogParser
  attr_reader :filename, :results, :unique_results

  def initialize(filename)
    @filename = filename
    @results = Hash.new { |h, k| h[k] = [] }
    @unique_results = Hash.new { |h, k| h[k] = [] }
  end

  def perform
    file_data = File.open(filename).readlines.map(&:chomp)
    formatted_file = FileFormatter.new(file_data)
    formatted_file.format_data

    OutputInfo.info(
      ResultsSorter.sort_results(formatted_file.results, 'asc'), 'total_visits'
    )
    OutputInfo.info(
      ResultsSorter.sort_results(formatted_file.unique_results, 'asc'), 'unique_visits'
    )
    OutputInfo.footer
  end
end
