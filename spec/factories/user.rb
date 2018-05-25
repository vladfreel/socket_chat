FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@ukr.net" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.zone.today
  end
end
