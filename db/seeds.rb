# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


500.times do
  Movie.create(
      name: Faker::Lorem.words(rand(1..6)).join(' '),
      year: Faker::Time.between(50.year.ago, Time.now).year,
      genre: ['Sci-Fi', 'Fantasy', 'Action', 'Romantic', 'Comedy', 'Biography', 'Thriller', 'Crime', 'War', 'Animation'].shuffle.first
  )
end