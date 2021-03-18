# frozen_string_literal: true

# This class outputs the formatted results to STDOUT

module OutputInfo
  def self.info(formatted_results, output_type)
    case output_type
    when 'total_visits'
      header('Total Visits')
      formatted_results.each { |i, a| puts "#{i} : #{a.count}" }
    when 'unique_visits'
      header('Total Unique Visits')
      formatted_results.each { |i, a| puts "#{i} : #{a.count}" }
    else
      raise StandardError.new, 'output type is required'
    end
  end

  def self.header(title)
    puts "####### #{title} #######"
    puts 'Page : Visits'
  end

  def self.footer
    puts '########################'
  end
end
