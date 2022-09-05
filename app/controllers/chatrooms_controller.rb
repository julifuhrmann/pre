class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all.where(user: params[:user])
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create

    @chatroom = Chatroom.where(sender_id: current_user).or(Chatroom.where(receiver_id: User.find(params[:user_id]))).first
    if @chatroom
      redirect_to chatroom_path(@chatroom)
    else
      @chatroom = Chatroom.new
      @chatroom.sender = current_user
      @chatroom.receiver = User.find(params[:user_id])
      @chatroom.save
      redirect_to chatroom_path(@chatroom)
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:sender_id, :receiver_id)
  end
end
