# frozen_string_literal: true

# This class sorts the results by visits

module ResultsSorter
  def self.sort_results(unsorted_results, order)
    return unsorted_results.sort_by { |_path, ips| ips.count } if order == 'desc'

    unsorted_results.sort_by { |_path, ips| -ips.count }
  end
end
