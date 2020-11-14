class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :region

  with_options presence: true do
  validates  :name
  validates  :text
  validates  :price, format: {with: /\A[0-9]+\z/}
  validates :image
  end
  belongs_to :user

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }
  
  validates :burden_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 0 } 
end