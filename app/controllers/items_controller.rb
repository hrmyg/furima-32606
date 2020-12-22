class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.find(params[:id])
    if @item.create
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :shipping_cost_id, :prefecture, :shipping_day_id, :image).merge(user_id: current_user.id)
end
