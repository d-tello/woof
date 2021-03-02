# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)






def create_users
  puts 'Creating users...'
  user = User.create(
    email: 'user@woof.com',
    password: '123456',
    username: 'donny',
    )
  puts "Created #{user.first_name}, email: #{user.email}, password: #{user.password}"

  user = User.create(
    email: 'admin@woof.com',
    password: '123456',
    username: 'admin'
    )
  puts "Created #{user.first_name}, email: #{user.email}, password: #{user.password}"
end

puts "Finished!"
