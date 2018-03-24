
require 'faker'
20.times do
  User.create!(
  email: Faker::Internet.unique.email,
  password: "password",
  password_confirmation: "password",
  role: 'standard',
  stripe_customer_id: 'stripe_customer_id'
  )
end
users = User.all

seed_user = User.create(
  email: "admin@admin.com",
  password: "password",
  password_confirmation: "password",
  role: "standard",
  stripe_customer_id: "stripe_customer_id"
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
