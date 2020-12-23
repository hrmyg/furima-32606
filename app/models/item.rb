class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do 
    validates :name
    validates :explanation
    validates :image
  end

  validates :category_id, :state_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { with: /\A[0-9]+\z/ }

  validates_inclusion_of :price, in: 300..9_999_999
end