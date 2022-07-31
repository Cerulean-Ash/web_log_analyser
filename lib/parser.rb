# frozen_string_literal: true

require './lib/sorter'
require './lib/printer'

# Class to read and parse a web log text file
class Parser
  def initialize(file_path)
    @file_path = file_path
    raise 'Invalid file path' unless file_exists?

    @file_data = transform
  end

  def parse
    File.readlines(@file_path)
  end

  def transform
    @file_data = parse.map(&:split).group_by(&:shift).transform_values(&:flatten)
  end

  def total_views
    puts 'list of webpages with TOTAL page views ordered from most page views to least page views'
    total_views = Sorter.sort_total_views(@file_data)
    Printer.print_views(total_views, 'total')
    puts ''
  end

  def unique_views
    puts 'list of webpages with UNIQUE page views ordered from most page views to least page views'
    unique_views = Sorter.sort_unique_views(@file_data)
    Printer.print_views(unique_views, 'unique')
  end

  def file_exists?
    File.file?(@file_path)
  end
end
