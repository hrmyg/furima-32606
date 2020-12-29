require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe '購入時の保存' do
    before do
      @buy = FactoryBot.build(:buy)
    end

    it '全ての値が正しく入力されていれば登録できる' do
      expect(@buy).to be_valid
    end
    it 'post_codeが空では登録できなない' do
      @buy.post_code = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと登録できない' do
      @buy.post_code = '1234567'
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Post code is invalid")
    end
    it 'prefecture_idが空では登録できない' do
      @buy.prefecture_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end
    it 'prefecture_idが1意外でないと登録できない' do
      @buy.prefecture_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では登録できない' do
      @buy.city = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では登録できない' do
      @buy.address = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingは空でも登録できる' do
      @buy.building = nil
      expect(@buy).to be_valid
    end
    it 'phone_numberが空では登録できない' do
      @buy.phone_number = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it 'phone_numberにハイフンがあると登録できない' do
      @buy.phone_number = "090-1234-56768"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは11桁以内でないと登録できない' do
      @buy.phone_number = "090123456789"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
