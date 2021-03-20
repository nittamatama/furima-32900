FactoryBot.define do
  factory :address do
    postal_code   {181-0002}
    city          {'三鷹市'}
    address       {'牟礼'}
    building_name {'アーチェリーハウス'}
    prefecture_id { 1 }
    phone_number  { 08001611279 }
  end
end
