class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  
  def index
    @record_address = RecordAddress.new
  end
  
  
  def create
    @record_address = RecordAddress.new(order_params)
    if @record_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      pay_item
      
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp::Charge.create(
    amount: @item.price, 
    card: order_params[:token], 
    currency: 'jpy'        
    )
  end
    

  def order_params
    params.require(:record_address).permit(:postal_code, :area_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], record_id: params[:record_id], token: params[:token])
  end
  
  
end
