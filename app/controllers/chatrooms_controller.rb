class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipient, only: [:create]
  before_action :set_chatroom, only: [:show]
  before_action :authorize_chatroom, only: [:create]

  def new
    if params[:recipient_id]
      @recipient = User.find(params[:recipient_id])
      @chatroom = Chatroom.new
      authorize @chatroom
    else
      flash[:alert] = "Recipient not specified."
      redirect_to root_path
    end
  end
  
  def create
    @recipient = User.find(params[:chatroom][:recipient_id])
    @chatroom = Chatroom.find_by(user: current_user, recipient: @recipient) ||
                Chatroom.find_by(user: @recipient, recipient: current_user)
  
    if @chatroom
      redirect_to @chatroom, notice: 'Chatroom already exists.'
    else
      @chatroom = Chatroom.new(chatroom_params)
      @chatroom.user = current_user
      @chatroom.recipient = @recipient
      @chatroom.slug = generate_unique_slug(@chatroom.name)
  
      Rails.logger.debug("Attempting to authorize chatroom #{@chatroom.inspect}")
  
      # Explicitly check if authorization is being performed
      if Pundit.policy(current_user, @chatroom).create?
        Rails.logger.debug("Authorized for creating chatroom")
      else
        Rails.logger.debug("Not authorized for creating chatroom")
      end
  
      authorize @chatroom
      
      if @chatroom.save
        redirect_to @chatroom, notice: 'Chatroom was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.includes(:user)
    # @message = @chatroom.messages.new
    @message = @chatroom.messages.new(user: current_user, description: params[:description])
    authorize @chatroom
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
    params.require(:chatroom).permit(:name)  # Exclude `recipient_id` and `slug` since they are set in the controller.
  end

  def generate_unique_slug(name)
    base_slug = name.parameterize
    slug = base_slug
    count = 1

    while Chatroom.exists?(slug: slug)
      slug = "#{base_slug}-#{count}"
      count += 1
    end

    slug
  end

  def authorize_chatroom
    authorize Chatroom
  end
end
