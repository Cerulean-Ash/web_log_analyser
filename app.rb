# frozen_string_literal: true

require './lib/parser'

def app
  raise 'No file argument provided' if ARGV[0].nil?

  log = Parser.new(ARGV[0])
  log.total_views
  log.unique_views
end

app
