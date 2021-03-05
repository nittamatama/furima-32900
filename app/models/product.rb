class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :delivery_period

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :selling_price, inclusion: {in:300..9999999}
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_period_id
    validates :prefecture_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_period_id
  end
  
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :selling_price, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
end
