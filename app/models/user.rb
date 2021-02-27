class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         with_options presence: true do
         validates :nickname
         validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "には全角文字を使用してください"}
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "には全角文字を使用してください"}
         validates :last_kana, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "には全角文字を使用してください"}
         validates :first_kana, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "には全角文字を使用してください"}
         validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください" }
         validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "には全角カタカナを使用してください" }
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字混合で設定してください" }
         validates :birthday
         end
end
