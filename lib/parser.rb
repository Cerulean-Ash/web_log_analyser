# file_data = File.readlines(ARGV[0]).map { |line| line.split}.group_by {|line| line.shift}.transform_values {|ip| ip.flatten}

require './lib/sorter'
require './lib/printer'

class Parser
  def initialize(file_path)
    @file_path = file_path
    @file_data = transform
  end

  def parse
    File.readlines(@file_path)
  end

  def transform
    @file_data = parse.map(&:split).group_by(&:shift).transform_values(&:flatten)
  end

  # def sort_total_views
  #   @file_data.transform_values {|v| v.length}.sort_by {|k, v| -v}.to_h
  # end

  # def sort_unique_views
  #   @file_data.transform_values {|v| v.uniq.length}.sort_by {|k, v| -v}.to_h
  # end

  # def print_views(views, type)
  #   views.each do |k, v|
  #     p "#{k} #{v} #{type} page #{pluralize(v)}"
  #   end
  # end

  # def pluralize(num)
  #   num < 2 ? 'view' : 'views'
  # end

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
end
