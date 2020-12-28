class BuyAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :post_code format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1}
  
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buy_id: buy_id)
  end
end