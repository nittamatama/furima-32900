FactoryBot.define do
  factory :address_purchase do
    postal_code   {'181-0002'}
    city          {'三鷹市'}
    address       {'牟礼'}
    prefecture_id { 1 }
    phone_number  { '08081611279' }
  end
end
