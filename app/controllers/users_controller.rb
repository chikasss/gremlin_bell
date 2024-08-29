class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :saved_trips, :created_routes, :created_reviews, :follow, :unfollow, :user_reviews, :followers, :following]

  def edit
    authorize @user
  end

  def index
    @users = policy_scope(User).where.not(id: current_user.id).order(created_at: :desc)
    authorize @users
  end

  def follow
    authorize @user, :follow?
    current_user.following << @user unless current_user == @user || current_user.following.include?(@user)
    redirect_to request.path
  end

  def unfollow
    authorize @user, :unfollow?
    current_user.following.delete(@user)
    redirect_to request.path
  end

  def followers
    authorize @user
    @followers = @user.followers
  end

  def following
    authorize @user
    @following = @user.following
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
    @bikes = @user.bikes
    # @saved_trips = @user.all_favorited
    @routes = @user.routes
    @reviews = @user.reviews
    @last_review = @reviews.last
    @posts = @user.posts.order(created_at: :desc).last(3)
  end

  def saved_trips
    authorize @user
    @saved_trips = @user.favorited_routes
  end

  def created_routes
    authorize @user
    @routes = @user.routes
  end

  def user_reviews
    authorize @user
    @reviews = @user.reviews.order(created_at: :desc)
  end

  def created_reviews
    authorize @user
    @reviews = @user.reviews
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :avatar, :social_links, :about, :prefecture)
  end

  def social_params
    params.require(:social_links).permit(:twitter, :facebook, :instagram, :youtube, :tiktok)
  end
end
