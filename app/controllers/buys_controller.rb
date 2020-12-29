class BuysController < ApplicationController
before_action :set_item, only: [:index, :create]

  def index
    @buy = Buy.new
  end


  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      @buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

