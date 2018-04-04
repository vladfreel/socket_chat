FactoryBot.define do
  factory :user do |f|
    f.email Faker::Internet.email
    f.username Faker::Name.first_name
    f.password 'password'
    f.password_confirmation 'password'
  end
end
