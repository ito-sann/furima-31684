class RecordsController < ApplicationController

  before_action :buy_item, only: [:index, :create]
  def index
    @user_record = UserRecord.new
  end
  
  def create
    @user_record = UserRecord.new(record_params)
    if @user_record.valid?
      pay_item
      @user_record.save
      redirect_to root_path
    else
      render action: :index
    end 
  end  

  private
   # 全てのストロングパラメーターを1つに統合
  def record_params
   params.permit(:postal_code, :region_id, :municipality, :house_number, :phone_number, :building_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def buy_item
    @item = Item.find(params[:item_id])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end  
end
