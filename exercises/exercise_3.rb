require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

system "clear"
puts "Exercise 3"
puts "----------"

# Your code goes here ...
@store3 = Store.find_by(id:3)
@store3.destroy

stores = Store.all

puts "Number of stores now is: #{stores.count}"