
require 'faker'

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
puts "#{Wiki.count} wikis created"
