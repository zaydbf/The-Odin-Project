# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

Kitten.destroy_all

Kitten.create!([
  { name: "Garfield", age: 5, cuteness: 6, softness: 8 },
  { name: "Mittens", age: 1, cuteness: 10, softness: 10 },
  { name: "Whiskers", age: 3, cuteness: 8, softness: 7 },
  { name: "Luna", age: 2, cuteness: 9, softness: 9 },
  { name: "Grumpy Cat", age: 7, cuteness: 4, softness: 5 }
])

puts "Success! Seeded #{Kitten.count} kittens into the database."
