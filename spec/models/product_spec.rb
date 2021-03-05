require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
  @product = FactoryBot.build(:product)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "product_name,description,selling_price,category_id,condition_id,delivery_fee_id,prefecture_id,delivery_period_idが存在すれば登録できる" do
      expect(@product).to be_valid
    end
end
