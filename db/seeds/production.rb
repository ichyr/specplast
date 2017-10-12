# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# User creation

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

titles = []

["пл. неім.", 
"пл. прих.", 
"пл. уч.", 
"пл. розв.", 
"пл. скоб", 
"пл. вірл.", 
"пл. гетьм. скоб", 
"пл. гетьм. вірл."].each { |t| titles << { title: t} }

Rank.create!(titles)