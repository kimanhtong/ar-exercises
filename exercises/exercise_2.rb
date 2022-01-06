require_relative '../setup'
require_relative './exercise_1'

system "clear"
puts "Exercise 2"
puts "----------"

# Your code goes here ...
@store1 = Store.find_by(id:1)
@store1.name = "Kanata"
@store1.save
@store2 = Store.find_by(id:2)

puts "The first 2 stores are now:"
puts @store1.name
puts @store2.name