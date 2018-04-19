FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@ukr.net" }
    sequence(:username) { |n| "login#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
