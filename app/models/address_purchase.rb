class AddressPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :address, :building_name, :prefecture_id, :phone_number, :purchase_id, :user_id, :product_id, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "郵便番号にはハイフンを入れてください"}
    validates :city
    validates :address
    validates :prefecture_id
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "電話番号にはハイフンを入れないでください"}
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, city: city, address: address, building_name: building_name, prefecture_id: prefecture_id, phone_number: phone_number, purchase_id: purchase.id)
  end
end