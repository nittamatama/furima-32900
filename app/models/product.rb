class Product < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition
  belongs_to :delivery_fee 
  belongs_to :prefecture 
  belongs_to :delivery_period

  with_options presence: true do 
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :selling_price, inclusion: {in:300..9999999}
    validates :image
  end


  with_options numericality: { other_than: 1, message: 'を入力してください' } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_period_id
  end
  
  validates :prefecture_id, numericality: { other_than: 0, message: 'を入力してください' }
  validates :selling_price, format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください" }
end
