# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'random_data'


50.times do
  Wiki.create!(
    title: RandomData.random_word,
    body: RandomData.random_paragraph,
    private: false
  )
end
wikis = Wiki.all


puts "Seed finished"
puts "#{Wiki.count} wikis created"
