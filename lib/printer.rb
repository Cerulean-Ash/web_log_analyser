# frozen_string_literal: true

# Class to print out values from a log - data in the form of a hash
class Printer

  def self.print_views(views, type)
    views.each do |k, v|
      p "#{k} #{v} #{type} page #{pluralize(v)}"
    end
  end

  def self.pluralize(num)
    num < 2 ? 'view' : 'views'
  end

end
