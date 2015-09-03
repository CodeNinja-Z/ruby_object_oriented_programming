# testArr = gets.chomp.split('').map {|x| x.to_i}
# puts testArr
require 'pry'
i = 15 # This is a local variable to the context which contains it, i.e. main object
binding.pry

def print_i
  puts i
end

print_i



=begin
1. class is blueprint to create multiples
2. class consists of: states and behaviors
3. You don't have to have a 'initialize' method to instantiate a class. This is same as in 
Java and C++, in either of which a class doesn't have to have a constructor to instantiate
an object. There is an implicit constructor(in Java and C++) being called if you don't 
define any constructor of your own. It is same in Ruby.

  
=end
