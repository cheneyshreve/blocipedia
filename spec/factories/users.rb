FactoryBot.define do
  sequence :email do |n|
    letters = ('a'..'z').to_a
    letters.shuffle!
    "letters#{n}@factory.com"
  end
  factory :user do
    email
    password              'password'
    password_confirmation 'password'
    confirmed_at          Time.now
    role :standard
    stripe_customer_id ""
  end

end
