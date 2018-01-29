# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
20.times do
  User.create!(
  email: Faker::Internet.unique.email,
  password: "password",
  password_confirmation: "password",
  role: 'standard'
  )
end
users = User.all

seed_user = User.create(
  email: "some_email@example.com",
  password: "password",
  password_confirmation: "password",
  role: 'standard'
)

10.times do
  Wiki.create!(
    user: seed_user,
    title: Faker::HitchhikersGuideToTheGalaxy.character,
    body: Faker::HitchhikersGuideToTheGalaxy.quote,
    private: false
  )
end
wikis = Wiki.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
