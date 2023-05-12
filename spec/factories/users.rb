FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    kana_last_name        { Faker::Japanese::Name.last_name.yomi }
    kana_first_name       { Faker::Japanese::Name.first_name.yomi }
    birthday              { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
  end
end
