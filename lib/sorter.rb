# frozen_string_literal: true

# Class to sort log data - data in the form of a hash - { key : [], }
class Sorter
  def self.sort_unique_views(data)
    data.transform_values { |v| v.uniq.length }.sort_by { |_k, v| -v }.to_h
  end

  def self.sort_total_views(data)
    data.transform_values(&:length).sort_by { |_k, v| -v }.to_h
  end
end
