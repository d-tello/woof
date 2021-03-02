# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


PARKSBERLIN = [
  'Wildenbruchplatz',
  'Goerlizer Park',
  'Hasenheide',
  'Tempelhofer Feld'
]

def delete_old_seeds
  puts 'Deleting old seeds...'
  DogsPark.destroy_all
  puts '=> Deleted all dogparks'
  Park.destroy_all
  puts '=> Deleted all parks'
  Dog.destroy_all
  puts '=> Deleted all dogs'
  User.destroy_all
  puts '=> Deleted all users'
end

def create_parks
  puts 'Creating park...'
  PARKSBERLIN.each do |park|
    new_park = Park.create(
      name: park,
      address: "#{park} Berlin"
    )
  puts "=> 🏞 Created Park #{new_park.name}"
  end
end

def create_user(i)
  puts 'Creating user...'
  user = User.create(
    email: "user#{i}@woof.com",
    password: '123456',
    username: Faker::Internet.username,
    )
  puts "=> 🧔 sCreated #{user.username}, email: #{user.email}, password: #{user.password}"
end

def create_dog
  puts 'Creating dog...'
    dog = Dog.create(
      name: Faker::Creature::Dog.name,
      age: rand(1..15),
      breed: Faker::Creature::Dog.breed,
      bio: Faker::Creature::Dog.meme_phrase,
      user: User.last
    )

    DogsPark.create(
      dog: dog,
      park: Park.all.sample
    )
  puts "=> 🐕 Created Dog #{dog.name} for #{dog.user.username} with park 🏞 #{dog.parks.first.name}"
end



puts "🌱🌱🌱🌱🌱🌱🌱🌱🌱 Seeds 🌱🌱🌱🌱🌱🌱🌱🌱🌱"
delete_old_seeds
create_parks
(1..10).to_a.each do |i|
  create_user(i)
  create_dog
end
puts "🌱🌱🌱🌱🌱🌱🌱🌱🌱 Finished! 🌱🌱🌱🌱🌱🌱🌱🌱🌱"
