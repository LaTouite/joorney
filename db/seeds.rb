# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

#Surveys
Survey.destroy_all
#Events
Event.destroy_all
#Users (Les Users doivent être détruits en dernier,
#car un Event ne peut exister sans User)
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
  name: "EVJF de Bernadette",
  event_category: "EVJF",
  token: "12345",
  user_id: User.last[:id]
},
{
  name: "EVG de Jean-Mimi",
  event_category: "EVG",
  token: "123456",
  user_id: User.last[:id],
  destination: "Lille"
},
{
name: "EVG de Nico",
event_category: "EVG",
token: "6789",
destination: "Prague",
user_id: User.last[:id]
}]

Event.create!(events_attributes)

puts 'Events created !'

puts 'Finished !'
