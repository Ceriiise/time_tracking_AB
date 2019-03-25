# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying all appointments"
Appointment.destroy_all

puts "Destroying all clients"
Client.destroy_all

puts "Destroying all users"
User.destroy_all

puts "Seeding users"
philippine = User.create!(email: 'philippine@abtasty.com', password: '123456')
calypso = User.create!(email: 'calypso@abtasty.com', password: '123456')

puts "Seeding users ok"

puts "Seeding clients"

philippine_client_one = Client.create!(
  name: "Danone",
  total_time: 60,
  user: philippine
)

philippine_client_two = Client.create!(
  name: "Starbuck",
  total_time: 150,
  user: philippine
)

calypso_client_one = Client.create!(
  name: "McDo",
  total_time: 60,
  user: calypso
)

calypso_client_two = Client.create!(
  name: "Total",
  total_time: 120,
  user: calypso
)

puts "Seeding clients ok"


first_appointment = Appointment.create!(
  date: '2018-12-15',
  duration: 60,
  user: philippine,
  client: philippine_client_two
)

second_appointment = Appointment.create!(
  date: '2019-03-27',
  duration: 90,
  user: philippine,
  client: philippine_client_two
)

thirth_appointment = Appointment.create!(
  date: '2019-03-03',
  duration: 60,
  user: philippine,
  client: philippine_client_one
)

fourth_appointment = Appointment.create!(
  date: '2019-03-27',
  duration: 120,
  user: calypso,
  client: calypso_client_two
)

fifth_appointment = Appointment.create!(
  date: '2019-03-18',
  duration: 60,
  user: calypso,
  client: calypso_client_one
)

puts "all done !"
