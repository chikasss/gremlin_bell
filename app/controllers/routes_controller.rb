class RoutesController < ApplicationController
  before_action :authenticate_user!

  RIDE_TYPE = Route::RIDE_TYPE

  def new
    @route = Route.new
    authorize @route
  end

  def index
    @routes = policy_scope(Route)
    @routes = Route.all

    results = []
    if params[:query]
      @routes.each do |route|
        results << route if route.ride_type.include?(params[:query][:ride_type])
      end
      @routes = results
    else
      @routes
    end
  end

  def show
    @route = Route.find(params[:id])
    authorize @route
    @reviews = @route.reviews.includes(:user)
    @review = @route.reviews.new
  end

  def save
    @route = Route.find(params[:id])
    current_user.favorite(@route)
    redirect_to @route
    flash[:notice] = "Route saved to your trips"
    authorize @route
  end

  private

  def route_params
    params.require(:route).permit(:title, :description, :waypoints, :videos_url, ride_type: [])
  end
end
