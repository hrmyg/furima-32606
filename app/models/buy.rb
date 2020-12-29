class Buy
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
  end

  def save
    buy_history = BuyHistory.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buy_history_id: buy_history.id)
  end
end