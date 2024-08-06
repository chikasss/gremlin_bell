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
    @reviews = @route.reviews.includes(:user)
    @comments = @route.comments.includes(:user)
  end
end
