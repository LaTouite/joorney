# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

#Choices
Choice.destroy_all
#Suggestions
Suggestion.destroy_all
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
user_id: User.last[:id]
}]

Event.create!(events_attributes)

puts 'Events created !'

puts 'Creating surveys...'

surveys_attributes =
[{
  name: "EVG de Nico",
  event_id: Event.last[:id]
}]
Survey.create!(surveys_attributes)
puts 'Surveys created !'

puts 'Creating suggestions...'

suggestions_attributes =
[{
  value: "Prague",
  survey_id: Survey.first[:id]
},
{
  value: "Marseille",
  survey_id: Survey.first[:id]
},
{
  value: "Lille",
  survey_id: Survey.first[:id]
}
#,
# {
#   start_date: Date.new(2019,08,26),
#   survey_id: Survey.first[:id],
#   topic_id: Topic.first[:id]
# }
]
Suggestion.create!(suggestions_attributes)
puts 'Suggestions created !'


puts 'Finished !'
