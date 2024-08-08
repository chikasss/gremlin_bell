class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :saved_trips]

  def edit
    authorize @user
  end

  def update
    authorize @user
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

end
