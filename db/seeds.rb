# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Rohit Mandge",
             email: "rnmandge@ncsu.edu",
             password:              "Superrohit@2010",
             password_confirmation: "Superrohit@2010",
             admin: true,
             member: true,
	)

#15.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@ncsu.edu"
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password)
#	       checkout_history: {})
#end
