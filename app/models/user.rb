class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, :first_name, :last_name, :first_kana, :last_kana, :birthday, presence: true
         validates :email, uniqueness: true
         validates :password, :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
