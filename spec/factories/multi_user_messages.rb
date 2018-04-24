FactoryBot.define do
  factory :multi_user_message do |f|
    f.content Faker::Lorem.sentence
  end
end
