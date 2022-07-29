# p ARGV[0]

require './lib/parser'

# file = File.open(ARGV[0])
# file_data = File.readlines(ARGV[0]).map { |line| line.split}.group_by {|line| line.shift}.transform_values {|ip| ip.flatten}
# p file_data

# p file_data.count()

# page_views = file_data.transform_values {|v| v.length}.sort_by {|k, v| -v}.to_h

# p page_views

# unique_views = file_data.transform_values {|v| v.uniq.length}.sort_by {|k, v| -v}.to_h

# p unique_views
# Tests
# p File.readlines(ARGV[0]).map { |line| line.split[0]}.count
# p File.readlines(ARGV[0]).map { |line| line.split[0]}.uniq

log = Parser.new(ARGV[0])


log.total_views
log.unique_views
