class BikesController < ApplicationController
  before_action :set_user
  BRAND = Bike::BRAND

  def index
    @bikes = policy_scope(Bike)
    @bikes = @user.bikes
  end

  def show
    @bike = user.bikes.find(params[:id])
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
    @brand = BRAND
    @year = (1900..Time.now.year).to_a.reverse
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    @brand = BRAND
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
    params.require(:bike).permit(:year, :brand, :name, photos:[])
  end
end
