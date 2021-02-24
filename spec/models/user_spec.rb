require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'emailは@を含まないと登録できない' do
      @user.email = "aaaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordとpassword_confirmationが6文字以下では登録できない' do
      @user.password = "1111b"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)"
    end
    it 'passwordは半角英数字混同でないと登録できない' do
      @user.password = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは半角英数字混同で設定してください")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationの値が一致しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'last_kanaは、全角（カタカナ）で入力しないと登録できない' do
      @user.last_kana = "hhhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("last_kanaには全角カタカナを使用してください")
    end
    it 'first_kanaは、全角（カタカナ）で入力しないと登録できない' do
      @user.first_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("first_kanaには全角カタカナを使用してください")
    end
    it 'birthdayが空だと登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end 
  end
end
