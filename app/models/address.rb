class Address < ApplicationRecord
  with_options presence: true do
    validates  :postal_code
    validates  :region_id
    validates  :municipality
    validates  :house_number
    validates  :phone_number
  end
  belongs_to :record
end
