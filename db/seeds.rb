# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#remove max file size limit for OpenURI
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

Faker::UniqueGenerator.clear

PARKSBERLIN = [
  'Wildenbruchplatz',
  'Görlitzer Park',
  'Hasenheide',
  'Tempelhofer Feld',
  'Volkspark Friedrichshain'
]

ACTIVITY = [
  "swim 🏊",
  "run 🏃",
  "walk around town🚶",
  "go on hikes ⛰️ ",
  "play in the park 🏞️ ",
  "laze around 🛋️",
  "wrestle 🤼",
  "play fetch 🦴",
  "chill out 😴",
  "dig holes 🕳️"
]

PERSONALITY = [
  "quite shy",
  "very active",
  "a bit naughty",
  "a little cheeky",
  "very loving",
  "lots of fun"
]

DOGEMOJI = [
  "🦴",
  "🐕",
  "🐶",
  "🐾",
  "🐩"
]

EMOJI = [
  "✨",
  "🌈",
  "💕",
  "😘",
  "⭐"
]

# get the breeds list from the API and assign to constant
req = open('https://dog.ceo/api/breeds/list/all').read
     data = JSON.parse(req)
    #     p data['message']
    BREEDS = []
     data['message'].each do|pair|
      if pair[1].length > 0
        pair[1].each do |breed|
          BREEDS << "#{pair[0]}/#{breed}" unless breed == "shepherd"
        end
      else BREEDS << pair[0]
      end
    end

def delete_old_seeds
  puts "\n=> Clearing existing seeds"
  DogsPark.destroy_all
  puts '=> Deleted all dogparks'
  Park.destroy_all
  puts '=> Deleted all parks'
  Dog.destroy_all
  puts '=> Deleted all dogs'
  User.destroy_all
  puts '=> Deleted all users'
  Sniff.destroy_all
  puts "=> Deleted all sniffs\n"

end

def create_parks
  puts "\n=> 🏞 Creating parks..."
  PARKSBERLIN.each do |park|
    new_park = Park.create(
      name: park,
      address: "#{park} Berlin"
    )
    puts "=> 🏞 Created #{new_park.name}"
  end
end

def create_dogs_park(dog)
  dogs_park = DogsPark.create(
    dog: dog,
    park: Park.find_by(name: PARKSBERLIN.sample)
  )
  dog.viewed_park = dogs_park.park
  dog.save!
  puts "=> 🏞 Assigning a park to #{dog.name}\n"
end

def create_user(user_number)
  puts "\n=> 🧔 Creating user #{user_number}...\n"
  user = User.new(
    username: Faker::Internet.unique.username,
    password: '123456'
  )
  fullname = user.username.split(/(\_|\.)/)
  user.firstname = fullname[0].capitalize
  user.lastname = fullname[2].capitalize unless fullname[2].nil?
  user.email = "user#{user_number}@woof.com"
  user.save!
  puts "=> Created #{user.firstname} #{user.lastname}"
  puts "- username: #{user.username}"
  puts "- email: #{user.email}"
  puts "- password: #{user.password}"
  puts "=> Downloading profile picture for #{user.firstname}"
  profile_picture = URI.open("https://kitt.lewagon.com/placeholder/users/random")
  user.photo.attach(io: profile_picture, filename: "#{user.username}.jpg", content_type: 'image/jpg')
end

def create_dog(breed)
  url = URI.open("https://dog.ceo/api/breed/#{breed}/images").read
  images_json = JSON.parse(url)
  photos = []
  3.times do |i|
    photos << images_json["message"][i] unless images_json["message"][i].nil?
  end
  files = []
  photos.each do |photo|
    files << URI.open(photo)
    sleep(1)
  end
  puts "\n=> 🐕 Creating dog for #{User.last.firstname}... \n"
  begin
    name = Faker::Creature::Dog.unique.name
  rescue
    name = Faker::TvShows::RuPaul.unique.queen.split(" ").first
  end
  dog = Dog.new(
    name: name,
    age: rand(1..15),
    breed: breed.split('/').reverse.join(' ').titleize,
    user: User.last,
    ready_to_walk: (1..3).to_a.sample != 3
  )
  dog.bio = "Hi I'm #{dog.name} and I'm #{dog.age.humanize} #{DOGEMOJI.sample}#{EMOJI.sample}\nI love to #{ACTIVITY.sample} with my owner #{dog.user.firstname}.\nMy friends say I am #{PERSONALITY.sample}. Let's be friends, sniff me! 🐽"
  dog.save!
  files.each_with_index do |file, i|
    puts "- Downloading #{dog.breed} picture #{i + 1}"
    dog.photos.attach(io: file, filename: "#{breed}#{i + 1}.jpg", content_type: 'image/jpg')
  end

  puts "\n=> 🐕 Done! #{dog.user.firstname}'s dog is called #{dog.name} and #{dog.ready_to_walk ? "is" : "is not"} ready to walk!\n"
  create_dogs_park(dog)
end

def create_sniff
  puts "\n=> 👃 Creating sniff..."
  pair = (Dog.first.id..Dog.last.id).to_a.shuffle.take(2)
  sniffer = pair[0]
  sniffed = pair[1]
  sniff = Sniff.create(sniffer: Dog.find_by(id: sniffer), sniffed: Dog.find_by(id: sniffed))
  puts "=> #{sniff.sniffer.name} sniffed #{sniff.sniffed.name}"
end

puts '🌱🌱🌱🌱🌱🌱🌱🌱🌱 Seeds 🌱🌱🌱🌱🌱🌱🌱🌱🌱'
delete_old_seeds
create_parks
BREEDS.each_with_index do |breed, i|
  create_user(i+1)
  create_dog(breed)
  puts "\n🦴🦴🦴\n"
end
puts "=> 👃 Generating sniffs..."
300.times { create_sniff }
puts '🌱🌱🌱🌱🌱🌱🌱🌱🌱 Finished! 🌱🌱🌱🌱🌱🌱🌱🌱🌱'
