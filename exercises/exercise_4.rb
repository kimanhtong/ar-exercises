require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
store4 = Store.new do |s|
  s.name = "Surrey"
  s.annual_revenue = 224000
  s.mens_apparel = false
  s.womens_apparel = true
end
store4.save

store5 = Store.new do |s|
  s.name = "Whistler"
  s.annual_revenue = 1900000
  s.mens_apparel = true
  s.womens_apparel = false
end
store5.save

store6 = Store.new do |s|
  s.name = "Yaletown"
  s.annual_revenue = 430000
  s.mens_apparel = true
  s.womens_apparel = true
end
store6.save

@mens_stores = Store.where(mens_apparel:true).where(womens_apparel:false)
@mens_stores.each do |s|
  puts "Name: #{s.name}, Revenue: #{s.annual_revenue}"
end

@womens_stores = Store.where("womens_apparel = ?","true").where("annual_revenue < ?","1000000")
@womens_stores.each do |s|
  puts "Name: #{s.name}, Revenue: #{s.annual_revenue}"
end