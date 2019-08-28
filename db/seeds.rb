# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

#Users
User.destroy_all

puts 'Creating users...'

users_attributes =
[{
first_name: "Sophie",
last_name: "Fonfec",
email: "sophie@gmail.com",
password: "8Lalasoso"
}]

User.create!(users_attributes)

puts 'Users created !'

puts 'Creating events...'

events_attributes =
[{
name: "EVG de Bernadette",
event_category: "EVJF",
token: "12345",
user_id: User.last[:id]
}]

Event.create!(events_attributes)

puts 'Events created !'

puts 'Finished !'
