class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, only: [:edit]
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to item_path
  #   else
  #     render :edit
  #   end
  # end


  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :burden_id, :category_id, :condition_id, :day_id, :region_id).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  # end
end
