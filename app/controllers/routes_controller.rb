class RoutesController < ApplicationController
  before_action :authenticate_user!

  RIDE_TYPE = Route::RIDE_TYPE
  PREFECTURE = User::PREFECTURES

  def index
    @routes = policy_scope(Route).order(:created_at)
    if params[:query].present?
      if params[:query][:prefecture].present?
        @routes = @routes.where(prefecture: params[:query][:prefecture])
      end
      if params[:query][:ride_type].present?
        @routes = @routes.where("'#{params[:query][:ride_type]}' = ANY (ride_type)")
      end
    end
  end

  def new
    @route = Route.new
    authorize @route
  end

  def create
    @route = Route.new(route_params)
    @route.waypoints = JSON.parse(route_params[:waypoints][0])
    #@route.waypoints = JSON.parse(route_params[:waypoints].to_s) rescue []
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
    @reviews = @route.reviews.includes(:user).order(date: :desc, created_at: :desc)
    @review = @route.reviews.new
    @comments = @route.comments.includes(:user).order(created_at: :desc)
    @road_condition =
      if @reviews.any?
        @reviews.first.road_condition
      else
        @route.road_condition
      end
    # @comments_last_3 = @route.comments.includes(:user).order(created_at: :desc).limit(3)
    @comment = @route.comments.new
    @tail = YouTubeRails.extract_video_id(@route.videos_url)
    ##@waypoints_json = @route.waypoints.to_json
  end

  def save
    @route = Route.find(params[:id])
    current_user.favorite(@route)
    redirect_to @route
    flash[:notice] = "Route saved to your trips"
    authorize @route
  end

  def unsave
    @route = Route.find(params[:id])
    current_user.unfavorite(@route)
    authorize @route

    if request.referer.include?(saved_trips_user_path(current_user))
      flash[:notice] = "Route removed from your saved trips"
      redirect_to saved_trips_user_path(current_user)
    else
      flash[:notice] = "Route removed from your trips"
      redirect_to @route
    end
  end

  private

  def route_params
    params.require(:route).permit(
      :title,
      :description,
      :prefecture, :videos_url,
      :road_condition,
      waypoints: [],
      ride_type: [],
      photos: []
    )
  end
end
