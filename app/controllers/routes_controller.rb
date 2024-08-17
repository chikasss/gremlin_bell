class RoutesController < ApplicationController
  before_action :authenticate_user!

  RIDE_TYPE = Route::RIDE_TYPE

  def index
    @routes = policy_scope(Route)
    @routes = Route.all.order(created_at: :desc)

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

  def new
    @route = Route.new
    authorize @route
  end

  def create
    @route = Route.new(route_params)
    @route.waypoints = JSON.parse(route_params[:waypoints][0])
    @route.user = current_user
    authorize @route
    if @route.save
      redirect_to route_path(@route)
    else
      render :new
    end
  end

  def show
    @route = Route.find(params[:id])
    authorize @route
    @reviews = @route.reviews.includes(:user).order(created_at: :desc)
    @review = @route.reviews.new
    @comments = @route.comments.includes(:user).order(created_at: :desc)
    # @comments_last_3 = @route.comments.includes(:user).order(created_at: :desc).limit(3)
    @comment = @route.comments.new
    @tail = YouTubeRails.extract_video_id(@route.videos_url)
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
    params.require(:route).permit(:title, :description, :videos_url, waypoints: [], ride_type: [], photos: [])
  end

end
