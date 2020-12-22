class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :shipping_cost, :prefecture, :shipping_day

  validates :name, :explanation, presence: true

  validates :category_id, :state_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, numericality: { other_then: 1 }
end
