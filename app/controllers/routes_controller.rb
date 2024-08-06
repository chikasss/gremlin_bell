class RoutesController < ApplicationController
  before_action :authenticate_user!

  def new
    @route = Route.new
    authorize @route
  end

  def index
    @routes = policy_scope(Route)
    @routes = Route.all
  end

  def show
    @route = Route.find(params[:id])
    authorize @route
    # @reviews = @route.reviews.includes(:user)
    # @comments = @route.comments.includes(:user)
  end

  private

  def route_params
    params.require(:route).permit(:title, :description, :waypoints, :videos_url, ride_type: [])
  end
end
