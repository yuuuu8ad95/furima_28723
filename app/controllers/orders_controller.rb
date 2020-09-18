class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @order = OrderDestination.new
  end

  def create
    @order = OrderDestination.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.permit(
      :postal_code, :from_id, :city, :address, :building_name, :phone_number, :token, :item_id
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
