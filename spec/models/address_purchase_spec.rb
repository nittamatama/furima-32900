require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @address = FactoryBot.build(:address_purchase)
  end

  describe '商品購入' do
    context '商品出品がうまくいくとき' do
      it 'postal_code, city, address, prefecture_id, phone_numberが存在すれば登録できる' do
      expect(@address).to be_valid
    end
    it "selling_priceとtokenがあれば保存できる" do
      expect(@address).to be_valid
    end
  end

    context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal codeを入力してください')
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @address.postal_code = '1810002'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code郵便番号にはハイフンを入れてください')
      end
      it 'cityが空だと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Cityを入力してください')
      end
      it 'Addressが空だと登録できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Addressを入力してください')
      end
      it 'Phone_numberが空だと登録できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone numberを入力してください')
      end
      it 'phone_numberにハイフンが入っていたら登録できない' do
        @address.phone_number = '080-8161-1279'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number電話番号にはハイフンを入れないでください')
      end
      it 'tokenが空では登録できないこと' do
        @address.token = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end
