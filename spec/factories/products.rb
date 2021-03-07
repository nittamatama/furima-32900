FactoryBot.define do
  factory :product do
    product_name	        {'ワンピース'}
    description           {'このワンピやばい'}
    selling_price         {'30000'}
    category_id { '2' }
    condition_id { '2' }
    delivery_fee_id { '2' }
    delivery_period_id { '2' }
    prefecture_id { '2' } 
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
  end
end
