class BikesController < ApplicationController
  before_action :set_user

  def index
    @bikes = policy_scope(Bike)
  end

  def show
    @bike = user.bikes.find(params[:id])
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike
    if @bike.save
      redirect_to user_bikes_path(current_user), notice: 'Bike successfully added!'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def bike_params
    params.require(:bike).permit(:year, :brand, :name)
  end
end
