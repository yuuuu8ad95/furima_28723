class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new 
    @item = UserDestination.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    @item = UserDestination.create(item_params)
  end

  def show
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
       redirect_to item_path
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
    description: 'test', 
    card: params[:card_token]
    )

  item = Item.new(
       card_token: params[:card_token],
       customer_token: customer.id,
       user_id: current_user.id
    )
    if card.save
      redirect_to root_path
    else
      redirect_to "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :explain, :price, :category_id, :cost_id, :day_id, :from_id, :status_id
    ).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:user_destination).permit(:postal_code, :prefecture_id, :city, :address,  :building_name, :phone_number)
    end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
