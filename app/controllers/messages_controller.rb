class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @message = @item.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id,item_id: params[@item.id])
  end
end
