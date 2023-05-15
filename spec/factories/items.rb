FactoryBot.define do
  factory :item do
    title             { Faker::Lorem.sentence }
    content           { Faker::Lorem.paragraph }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    charge_id         { Faker::Number.between(from: 2, to: 3) }
    area_id           { Faker::Number.between(from: 2, to: 48) }
    shipping_time_id  { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9999999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/staff2.jpg'), filename: 'staff2.jpg')
    end
  end
end
