class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :saved_trips]


  def edit
    authorize @user
  end

  def update
    authorize @user
    
    if @user.update(user_params.merge(social_links: social_params))
      redirect_to root_path, notice: "Profile was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    authorize @user
  end

  def saved_trips
    authorize @user
    @saved_trips = @user.all_favorited
    # @user.favorited_routes
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :social_links, :about, :prefecture)
  end

  def social_params
    params.require(:social_links).permit(:twitter, :facebook, :instagram, :youtube, :tiktok)
  end
end
