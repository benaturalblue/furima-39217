FactoryBot.define do
  factory :record_address do
    postal_code  { Faker::Number.unique.number(digits: 3).to_s + '-' + Faker::Number.unique.number(digits: 4).to_s }
    area_id      { Faker::Number.between(from: 2, to: 48) }
    city         { Faker::Address.city }
    house_number { Faker::Address.street_address }
    phone_number { Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11))}
    token        {"tok_abcdefghijk00000000000000000"}
  end
  
end

