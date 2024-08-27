class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipient, only: [:create]
  before_action :set_chatroom, only: [:show]
  before_action :authorize_chatroom, only: [:create]
  
  def index
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(recipient: current_user))

    @chatroom_data = @chatrooms.map do |chat|
      chat_user = chat.recipient == current_user ? chat.user : chat.recipient
      last_message = chat.messages.last
      
      {
        chatroom: chat,
        chat_user: chat_user,
        last_message: last_message,
        unread_count: chat.unread_messages_count(current_user)
      }
    end
  end
  
  def new
    if params[:recipient_id]
      @recipient = User.find(params[:recipient_id])
      @chatroom = Chatroom.new(recipient: @recipient)
      authorize @chatroom
    else
      flash[:alert] = "Recipient not specified."
      redirect_to chatrooms_path
    end
  end  

  def create
    @recipient = User.find(params[:chatroom][:recipient_id])
    @chatroom = Chatroom.find_by(user: current_user, recipient: @recipient) ||
                Chatroom.find_by(user: @recipient, recipient: @recipient)
    
    if @chatroom
      @message = @chatroom.messages.create(user: current_user, description: params[:description])
      redirect_to @chatroom
    else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.user = current_user
      @chatroom.recipient = @recipient
      
      authorize @chatroom
      
      if @chatroom.save
        @message = @chatroom.messages.create(user: current_user, description: params[:description])
        
        if @message.persisted?
          redirect_to @chatroom
        else
          Rails.logger.debug("Failed to Save Message: #{@message.errors.full_messages}")
          flash[:alert] = "Chatroom was created, but the first message could not be saved."
          redirect_to @chatroom
        end
      else
        Rails.logger.debug("Failed to Save Chatroom: #{@chatroom.errors.full_messages}")
        render :new, status: :unprocessable_entity
      end
    end
  end     

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.includes(:user)
    @message = @chatroom.messages.new(user: current_user, description: params[:description])
    authorize @chatroom
    @messages.unread_by_user(current_user).update_all(read_at: Time.current)
  end

  private

  def set_recipient
    recipient_id = params[:chatroom][:recipient_id] || params[:recipient_id]
    @recipient = User.find(recipient_id) if recipient_id.present?
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found."
    redirect_to root_path
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Chatroom not found."
    redirect_to root_path
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :recipient_id, :private, :slug)
  end 

  # def generate_unique_slug
  #   recipient = User.find(@chatroom.recipient_id)
  #   base_slug = "#{recipient.first_name} chat".parameterize
  #   slug = base_slug
  #   count = 1
  
  #   while Chatroom.exists?(slug: slug)
  #     slug = "#{base_slug}-#{count}"
  #     count += 1
  #   end
  
  #   slug
  # end
  
  def authorize_chatroom
    authorize Chatroom
  end
end
