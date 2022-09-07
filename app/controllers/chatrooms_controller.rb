class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all.where(sender: current_user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.sender == current_user
      @asker = @chatroom.sender
      @answerer = @chatroom.receiver
    else
      @asker = @chatroom.receiver
      @answerer = @chatroom.sender
    end
    @message = Message.new
  end

  def new
    @host = Party.find(params[:id]).user
    @chatroom = Chatroom.where(sender: current_user, receiver: @host).first ||
    Chatroom.where(sender: @host, receiver: current_user).first
    if @chatroom
      redirect_to chatroom_path(@chatroom)
    else
      @chatroom = Chatroom.new
      redirect_to create_chatroom_path(request.parameters)
    end
  end

  def create
    @receiver = Party.find(params[:id]).user
    @chatroom = Chatroom.new
    @chatroom.sender = current_user
    @chatroom.receiver = User.find(@receiver.id)
    @chatroom.save!
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:sender_id, :receiver_id)
  end
end
