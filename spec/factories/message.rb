FactoryBot.define do
  factory :message do |f|
    f.body Faker::Lorem.sentence
  end
end
