# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  Admin.create!(username: Faker::Internet.unique.user_name,
    password: '123456',
    email: Faker::Internet.unique.email,
    name: Faker::Name.name,
    gender: rand(0..2),
    role: rand(0..2),
    confirmation_sent_at: Time.now(),
    confirmed_at: Time.now(),
    confirmation_token: rand(100000..999999),
    reset_password_sent_at: Time.now(),
    reset_password_token: rand(100000..999999),)
end

Admin.create!(username: 'duyenbui',
    password: '123456',
    email: 'anhduyen1510@gmail.com',
    name: 'anhduyen',
    gender: rand(0..2),
    role: rand(0..2),
    confirmation_sent_at: Time.now(),
    confirmed_at: Time.now(),
    confirmation_token: rand(100000..999999),
    reset_password_sent_at: Time.now(),
    reset_password_token: rand(100000..999999),)

puts 'Admin'