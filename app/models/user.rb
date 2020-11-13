class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :kanji_sei_name, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :kanji_mei_name, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :katakana_sei_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :katakana_mei_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
  has_many :items
  has_many :records
end
