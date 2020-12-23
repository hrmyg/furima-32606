require 'rails_helper'

RSpec.describe '商品出品機能', type: :model do
  
    before do
      @item = FactoryBot.build(:item)
    end

  context '商品出品がうまくいくとき' do
    it 'name、explanation、category_id、state_id、shipping_cost_id、prefecture_id、shipping_day_id、price、imageが存在していれば登録できること' do
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では登録できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'explanationが空では登録できない' do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to  include("Explanation can't be blank")
    end
    it 'categoty_idが空では登録できない' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it 'state_idが空では登録できない' do
      @item.state_id =""
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it 'shipping_cost_idが空では登録できない' do
      @item.shipping_cost_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost is not a number")
    end
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day is not a number")
    end
    it 'priceが空では登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'priceが299以下の場合登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが10_000_000以上の場合登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが半角数字でない場合登録できない' do
      @item.price = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list")
    end
  end
end
