# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(login: 'test', email: 'test@gmail.com', password: '123qwe123')
Place.create(lat: 1, lng: 1)

100.times {
  User.last.plans.create(title: Faker::Space.galaxy, description: Faker::Lorem.sentence(word_count: 30), user_id: 1, rating: rand(1..5), price: rand(1..100))
}

User.last.plans.all.each { |parent| 
  
  5.times {
    checkpoint = nil

    rand(1...4).times {
      place = Place.create(lat: rand(30...35), lng: rand(110...115))
      checkpoint = parent.checkpoints.create(
        user_id: 1,
        place_id: place.id,
        title: Faker::Space.galaxy,
        description: Faker::Lorem.sentence(word_count: 30),
      )
    }
    
    parent = checkpoint
}
  
}