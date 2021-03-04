# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#remove max file size limit for OpenURI
require 'nokogiri'

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

PARKSBERLIN = [
  'Wildenbruchplatz',
  'Goerlizer Park',
  'Hasenheide',
  'Tempelhofer Feld'
]

BREEDS = []
url = "https://dog.ceo/dog-api/breeds-list"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

p html_doc.xpath("//option")

# javascript function
# var li = document.getElementsByClassName("dog-selector")
# li[0].childNodes.forEach((breed) => {
#   console.log(breed.value);
# });


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
  puts 'Deleting old sniffs...'
  Sniff.destroy_all
  puts 'Deleting old chatrooms...'
  Chatroom.destroy_all
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
    username: Faker::Internet.username
  )
  puts "=> 🧔Created #{user.username}, email: #{user.email}, password: #{user.password}"
end

def create_dog(breed)
  url = URI.open("https://dog.ceo/api/breed/#{breed}/images").read
  images_json = JSON.parse(url)
  photos = []
  3.times do |i|
    photos << images_json["message"][i]
  end
  files = []
  photos.each do |photo|
    files << URI.open(photo)
    sleep(1)
  end
  puts 'Creating dog...'
  dog = Dog.create(
    name: Faker::Creature::Dog.name,
    age: rand(1..15),
    breed: breed.capitalize,
    bio: Faker::Creature::Dog.meme_phrase,
    user: User.last
  )
  files.each_with_index do |file, i|
    puts "Downloading #{breed.capitalize} picture #{i + 1}"
    dog.photos.attach(io: file, filename: "#{breed}#{i + 1}", content_type: 'image/jpg')
  end

  puts "=> 🐕 Created Dog #{dog.name} for #{dog.user.username.capitalize}"
end

def create_dogs_park
  dogs_park = DogsPark.new
  dogs_park.dog = Dog.first
  dogs_park.park = Park.first
  dogs_park.save
  puts '=> Create a dog park'
end

def create_sniff
  puts 'Creating sniff...'
  sniff = Sniff.create(
    sniffer: Dog.first,
    sniffed: Dog.last
  )
  puts "=> Created Sniff between #{sniff.sniffer.name} and #{sniff.sniffed.name}"
end

def create_chatroom
  chatroom = Chatroom.new
  chatroom.sniff = Sniff.first
  chatroom.save
  puts '=> Create a chatroom'
end

# puts '🌱🌱🌱🌱🌱🌱🌱🌱🌱 Seeds 🌱🌱🌱🌱🌱🌱🌱🌱🌱'
# delete_old_seeds
# create_parks
# BREEDS.each_with_index do |breed, i|
#   create_user(i+1)
#   create_dog(breed)
# end
# create_sniff
# create_chatroom
# create_dogs_park
# puts '🌱🌱🌱🌱🌱🌱🌱🌱🌱 Finished! 🌱🌱🌱🌱🌱🌱🌱🌱🌱'
