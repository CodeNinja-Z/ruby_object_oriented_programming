module Perimeter
  class Array
    def initialize
      @size = 400
    end
  end
end

our_array = Perimeter::Array.new
ruby_array = Array.new

# p is a shorthand way of writing puts
p our_array.class
p ruby_array.class
