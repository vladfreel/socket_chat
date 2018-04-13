FactoryBot.define do
  factory :chat_room do |f|
    f.title Faker::Name.name
  end
end
