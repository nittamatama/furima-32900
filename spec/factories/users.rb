FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    nickname              {'test'}
    password              {'2108black'}
    password_confirmation {'2108black'}
    last_name             {'新田'}
    first_name            {'正尭'}
    last_kana             {'ニッタ'}
    first_kana            {'マサタカ'}
    birthday              {'1990-10-24'}
  end
end