require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
    it "product_name,description,selling_price,category_id,condition_id,delivery_fee_id,prefecture_id,delivery_period_id,imageが存在すれば登録できる" do
    expect(@product).to be_valid
    end
    it 'product_nameが40文字以下なら出品できる' do
      expect(@product).to be_valid
    end
    it 'descriptionが1000字以下であれば出品できる' do
      expect(@product).to be_valid
    end
    it 'selling_priceが300円〜9,999,999円の間なら出品できる' do
      expect(@product).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it 'product_nameが空だと登録できない' do
      @product.product_name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product nameを入力してください")
      end
    it 'descriptionが空だと登録できない' do
      @product.description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Descriptionを入力してください")
    end
    it 'selling_priceが空だと登録できない'do
      @product.selling_price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Selling priceを入力してください")
    end
    it 'category_idが空だと登録できない' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Categoryを入力してください") 
    end
    it 'condition_idが空だと登録できない' do
      @product.condition_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Conditionを入力してください")
    end
    it 'delivery_fee_idが空だと登録できない' do
      @product.delivery_fee_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery feeを入力してください")
    end
    it 'prefecture_idが空だと登録できない' do
      @product.prefecture_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefectureを入力してください")
    end
    it 'delivery_period_idが空だと登録できない' do
      @product.delivery_period_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery periodを入力してください")
    end
    it 'selling_priceが300円以下だと登録できない' do
      @product.selling_price = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Selling priceは一覧にありません")
    end
    it 'selling_priceが9,999,999円以上だと登録できない' do
      @product.selling_price = 100000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Selling priceは一覧にありません")
    end
    it 'selling_priceは半角数字以外は登録できない' do
      @product.selling_price = '１１１１１１１'
      @product.valid?
      expect(@product.errors.full_messages).to include("Selling priceは一覧にありません")
     end
     it 'selling_priceは英数混合では登録できない' do
       @product.selling_price = 'aaa123'
       @product.valid?
       expect(@product.errors.full_messages).to include("Selling priceは一覧にありません")
     end
     it 'selling_priceは半角英語のみでは登録できない' do
       @product.selling_price = 'aaa'
       @product.valid?
       expect(@product.errors.full_messages).to include("Selling priceは一覧にありません")
     end
     it '画像が空だと投稿できない' do
       @product.image = nil
       @product.valid?
       expect(@product.errors.full_messages).to include("Imageを入力してください")
     end
   end
 end
end
