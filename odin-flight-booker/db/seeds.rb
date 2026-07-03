# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear out old data
Airport.delete_all
Flight.delete_all

# Create Airports
sfo = Airport.create!(code: "SFO")
jfk = Airport.create!(code: "JFK")
lax = Airport.create!(code: "LAX")
ord = Airport.create!(code: "ORD")

# Create Flights spread over the next couple of days
Flight.create!(departure_airport: sfo, arrival_airport: jfk, departure_time: DateTime.now + 1.day, duration: 300)
Flight.create!(departure_airport: jfk, arrival_airport: sfo, departure_time: DateTime.now + 1.day, duration: 360)
Flight.create!(departure_airport: lax, arrival_airport: ord, departure_time: DateTime.now + 2.days, duration: 240)
Flight.create!(departure_airport: ord, arrival_airport: lax, departure_time: DateTime.now + 2.days, duration: 260)
Flight.create!(departure_airport: sfo, arrival_airport: lax, departure_time: DateTime.now + 3.days, duration: 90)

puts "Seeded #{Airport.count} airports and #{Flight.count} flights!"
