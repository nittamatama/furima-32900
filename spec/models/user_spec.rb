require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nickname、email、password、password_confirmation、last_name、first_name、
    last_kana、first_kana、birthdayが存在すれば登録できる' do
    expect(@user).to be_valid
    end
  end

  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = "aaaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'passwordとpassword_confirmationが5文字以下では登録できない' do
      @user.password = "1111b"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordとpassword_confirmationの値が一致しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordは半角英数字混合でないと登録できない（英のみ）' do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で設定してください")
    end
    it 'passwordは半角英数字混合でないと登録できない（数のみ）' do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で設定してください")
    end
    it 'passwordは半角でなければ登録できない' do
      @user.password = "ｂ123eee"
      @user.password_confirmation = "ｂ123eee"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字混合で設定してください")
    end
    it 'last_nameは空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last nameを入力してください")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameを入力してください")
    end
    it 'last_nameは全角文字でないと登録できない' do
    @user.last_name = "ｱｱ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last nameには全角文字を使用してください")
    end
    it 'first_nameは全角文字でなければ登録できない' do 
      @user.first_name = "ｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameには全角文字を使用してください")
    end
    it 'last_kanaが空だと登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kanaを入力してください')
    end
    it 'first_kanaが空だと登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kanaを入力してください")
    end
    it 'last_kanaは、全角（カタカナ）で入力しないと登録できない' do
      @user.last_kana = "ｱｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kanaには全角カタカナを使用してください")
    end
    it 'first_kanaは、全角（カタカナ）で入力しないと登録できない' do
      @user.first_kana = "ｱｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kanaには全角カタカナを使用してください")
    end
    it 'birthdayが空だと登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include('Birthdayを入力してください')
    end 
   end
  end
end
