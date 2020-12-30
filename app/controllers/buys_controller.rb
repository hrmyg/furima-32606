class BuysController < ApplicationController
before_action :set_item, only: [:index, :create]

  def index
    @buy = Buy.new
  end


  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
