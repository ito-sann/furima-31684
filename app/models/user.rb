class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname    
    validates :birthday
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end

  with_options presence: true, format: { with: /\A[一-龥ぁ-ん]/ } do
    validates :kanji_sei_name
    validates :kanji_mei_name
  end 

  with_options presence: true, format:  { with: /\A[ァ-ヶー－]+\z/ } do
    validates :katakana_sei_name
    validates :katakana_mei_name
  end  
  has_many :items
  has_many :records
end
