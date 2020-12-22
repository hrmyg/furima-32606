class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :explanation, :price, :image, presence: true

  validates :category_id, :state_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, numericality: { other_then: 1 }
end
