class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
  
    authorize @message
  
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          message: render_to_string(partial: "messages/message", locals: { message: @message, current_user: current_user }),
          user_id: current_user.id
        }
      )
      head :ok
    # if @message.save
    #   ChatroomChannel.broadcast_to(
    #     @chatroom,
    #     message: {
    #       id: @message.id,
    #       description: @message.description,
    #       user_id: @message.user_id,
    #       created_at: @message.created_at.strftime('%b %d, %H:%M'),
    #       current_user_id: current_user.id
    #     }
    #   )
    #   head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end     
  end
  
  private

  def message_params
    params.require(:message).permit(:description, :read_at, :chatroom_id, :user_id)
  end
end
