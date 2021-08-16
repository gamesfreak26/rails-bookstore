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

authors = [
  { name: 'Neil Gaiman', dob: '1960-11-10', biography: 'Neil Richard MacKinnon Gaiman is an English author of short fiction, novels, comic books, graphic novels, nonfiction, audio theatre, and films. His works include the comic book series The Sandman and novels Stardust, American Gods, Coraline, and The Graveyard Book. ' },
  { name: 'Terry Pratchett', dob: '1948-04-28', biography: "Sir Terence David John Pratchett OBE was an English humorist, satirist, and author of fantasy novels, especially comical works. He is best known for his Discworld series of 41 novels. Pratchett's first novel, The Carpet People, was published in 1971" },
  { name: 'Phillip Pullman', dob: '1946-10-19', description: 'Sir Philip Pullman, CBE, FRSL is an English author of high-selling books, including the fantasy trilogy His Dark Materials and a fictionalised biography of Jesus, The Good Man Jesus and the Scoundrel Christ. In 2008, The Times named Pullman one of the "50 greatest British writers since 1945"' },
]

if Genre.count.zero?
  genres.each do |genre|
    Genre.create(name: genre[:name], description: genre[:description])
    p "Created '#{genre[:name]}' genre with '#{genre[:description]}' description"
  end
end

if Author.count.zero?
  authors.each do |author|
    Author.create(name: author[:name], dob: Date.parse(author[:dob]), biography: author[:biography])
    p "Created '#{author[:name]}'"
  end
end

# if Book.count.zero?
#   5.times do
#     Book.create(name: Faker::Books::CultureSeries.book, description: Faker::Fantasy::Tolkien.poem, price: 4, genre_id: 1)
#     p "Created book"
#   end
# end
