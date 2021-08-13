# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = [
  { name: 'Science Fiction', description: 'Lots of spaceships' },
  { name: 'Fantasy', description: 'Wizards and things' },
  { name: 'Non-Fiction', description: 'Most of the boring stuff' },
  { name: 'Self-Improvement', description: 'how to get better at life' }
]

if Genre.count.zero?
  genres.each do |genre|
    Genre.create(name: genre[:name], description: genre[:description])
    p "Created '#{genre[:name]}' genre with '#{genre[:description]}' description"
  end
end

# if Book.count.zero?
#   5.times do
#     Book.create(name: Faker::Books::CultureSeries.book, description: Faker::Fantasy::Tolkien.poem, price: 4, genre_id: 1)
#     p "Created book"
#   end
# end
