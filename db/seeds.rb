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
  { name: 'Phillip Pullman', dob: '1946-10-19', biography: 'Sir Philip Pullman, CBE, FRSL is an English author of high-selling books, including the fantasy trilogy His Dark Materials and a fictionalised biography of Jesus, The Good Man Jesus and the Scoundrel Christ. In 2008, The Times named Pullman one of the "50 greatest British writers since 1945"' },
  { name: 'Oscar Wilde', dob: '1854-10-16', biography: "Oscar Fingal O'Flahertie Wills Wilde was an Irish poet and playwright. After writing in different forms throughout the 1880s, he became one of the most popular playwrights in London in the early 1890s."},
  { name: 'William Shakespeare', dob: '1564-4-26', biography: "William Shakespeare was an English playwright, poet, and actor, widely regarded as the greatest writer in the English language and the world's greatest dramatist. He is often called England's national poet and the 'Bard of Avon'" },
  { name: 'H.P.Lovecraft', dob: '1890-08-20', biography: "Howard Phillips Lovecraft was an American writer of weird, science, fantasy, and horror fiction. Lovecraft is best known for his creation of a body of work that became known as the Cthulhu Mythos. Born in Providence, Rhode Island, Lovecraft spent most of his life in New England. " }
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

if Book.count.zero?
  5.times do
    Book.create(name: Faker::Books::CultureSeries.book, description: Faker::Fantasy::Tolkien.poem, price: 4, genre_id: Faker::Number.between(from: 1, to: 4), author_ids: [Faker::Number.between(from: 1, to: 6), Faker::Number.between(from: 1, to: 6)])
    p "Created book"
  end
end
