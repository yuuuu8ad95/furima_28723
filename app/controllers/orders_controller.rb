class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderDestionation.new
  end

  def create
    @order = OrderDestination.new(order_params)
    @order.save

  end

  private 
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address,  :building_name, :phone_number, :item_id)
  end

  #def order_params
  #  params.require(:order).permit(:image, :explain, :price).merge(item_id: params[:item_id])
  #end

end
