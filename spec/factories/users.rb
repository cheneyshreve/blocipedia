FactoryGirl.define do

  factory :user do
    sequence(:email)      { |n| "person#{n}@example.com" }
    password              'password'
    password_confirmation 'password'
    confirmed_at          Time.now
    sequence(:id)         { |n| n }
  end
end
