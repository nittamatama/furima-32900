FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Name.initials(number: 2)}
    first_name            {Faker::Name.initials(number: 3)}
    last_kana             {Faker::Name.initials(number: 4)}
    first_kana            {Faker::Name.initials(number: 4)}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 25)}
  end
end