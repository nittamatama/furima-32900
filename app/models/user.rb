class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         with_options presence: true do
           with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "には全角文字を使用してください"} do
             validates :last_name 
             validates :first_name
           end
           with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "には全角文字を使用してください"} do
             validates :last_kana
             validates :first_kana
           end
           with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください" } do
             validates :last_kana
             validates :first_kana
           end
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字混合で設定してください" }
         validates :birthday
         validates :nickname
         end
end
