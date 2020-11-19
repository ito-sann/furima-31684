class UserRecord
  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to :region

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :municipality, :house_number, :phone_number, :building_number, :user_id, :item_id,:token

  

  
  with_options presence: true do
    validates  :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates  :municipality
    validates  :house_number
    validates  :phone_number, format: {with: /\A\d{10,11}\z/}
    validates  :token

  end
  validates :region_id, numericality: { other_than: 0 }

  def save
    # 購入記録の保存
    record = Record.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, region_id: region_id, municipality: municipality, house_number: house_number, phone_number: phone_number, building_number: building_number, record_id: record.id)
  end

end