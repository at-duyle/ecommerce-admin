# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shop.create()

10.times do |i|
  Shop.create(
    name: FFaker::Company.name,
    address: FFaker::Address.street_address,
    phone_number: FFaker::PhoneNumber.phone_number,
    logo: Faker::Company.logo,
    latitude: 16.069815,
    longitude: 108.207000)
end
puts 'Shop'

Admin.create!(username: 'admin',
    password: '123456',
    email: 'admin@gmail.com',
    name: 'admin',
    gender: rand(0..2),
    role: 0,
    confirmation_sent_at: Time.now(),
    confirmed_at: Time.now(),
    confirmation_token: rand(100000..999999),
    reset_password_sent_at: Time.now(),
    reset_password_token: rand(100000..999999),
    shop_id: 1)

k = 0
9.times do |i|
  k = i + 2
  admin = Admin.create!(username: Faker::Internet.unique.user_name,
    password: '123456',
    email: Faker::Internet.unique.email,
    name: Faker::Name.name,
    gender: rand(0..2),
    role: 1,
    confirmation_sent_at: Time.now(),
    confirmed_at: Time.now(),
    confirmation_token: rand(100000..999999),
    reset_password_sent_at: Time.now(),
    reset_password_token: rand(100000..999999),
    shop_id: k)
  3.times do |j|
    Admin.create!(username: Faker::Internet.unique.user_name,
        password: '123456',
        email: Faker::Internet.unique.email,
        name: Faker::Name.name,
        gender: rand(0..2),
        role: 2,
        confirmation_sent_at: Time.now(),
        confirmed_at: Time.now(),
        confirmation_token: rand(100000..999999),
        reset_password_sent_at: Time.now(),
        reset_password_token: rand(100000..999999),
        manager_id: admin.id,
        shop_id: k)
end
end

admin_temp = Admin.create!(username: 'duyenbui',
    password: '123456',
    email: 'anhduyen1510@gmail.com',
    name: 'anhduyen',
    gender: rand(0..2),
    role: 1,
    confirmation_sent_at: Time.now(),
    confirmed_at: Time.now(),
    confirmation_token: rand(100000..999999),
    reset_password_sent_at: Time.now(),
    reset_password_token: rand(100000..999999),
    shop_id: 11)

Admin.create!(username: 'duyle',
    password: '123456',
    email: 'ngocduy307@gmail.com',
    name: 'Duy Le',
    gender: rand(0..2),
    role: 2,
    confirmation_sent_at: Time.now(),
    confirmed_at: Time.now(),
    confirmation_token: rand(100000..999999),
    reset_password_sent_at: Time.now(),
    reset_password_token: rand(100000..999999),
    manager_id: admin_temp.id,
    shop_id: 10)

puts 'Admin'