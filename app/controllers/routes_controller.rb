class RoutesController < ApplicationController
  require_relative '../services/weather_service'
  before_action :authenticate_user!

  RIDE_TYPE = Route::RIDE_TYPE
  PREFECTURE = Route::PREFECTURES
  PREFECTURES_HASH = User::PREFECTURES_HASH

  def index
    @routes = policy_scope(Route).order(:created_at)
    @region_prefectures = PREFECTURES_HASH

    if params[:query].present?
      if params[:query][:region].present?
        @routes = @routes.where(prefecture: @region_prefectures[params[:query][:region].to_sym])
      end
      if params[:query][:prefecture].present?
        @routes = @routes.where(prefecture: params[:query][:prefecture])
        @prefecture_routes = @routes.where(prefecture: params[:query][:prefecture])
      end
      if params[:query][:ride_type].present?
        @routes = @routes.where("'#{params[:query][:ride_type]}' = ANY (ride_type)")
      end
    end
  end


  def new
    @route = Route.new
    @waypoints = []
    authorize @route
  end

  def create
    @route = Route.new(route_params)
    #@route.waypoints = JSON.parse(route_params[:waypoints][0])

    if route_params[:waypoints].present? && route_params[:waypoints][0].present?
      @route.waypoints = JSON.parse(route_params[:waypoints][0])
    else
      @route.waypoints = []
    end

    @route.user = current_user
    authorize @route
    if @route.save
      if params[:route][:photos].present?
        params[:route][:photos].each do |uploaded_file|
          new_photo = @route.photos.build(user: current_user)
          new_photo.image.attach(uploaded_file)
          new_photo.save!
        end
      end
      redirect_to @route, notice: 'Route was successfully created.'
    else
      render :new, alert: @route.errors.full_messages.to_sentence
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
    @current_weather = WeatherService.new(@route.waypoints[0][1], @route.waypoints[0][0], "metric").get_current_weather
    @forecast = WeatherService.new(@route.waypoints[0][1], @route.waypoints[0][0], "metric").get_forecast
    # @waypoints_json = @route.waypoints.to_json
    # @current_weather = open_weather_api.current lat: @route.waypoints[0][1].to_f, lon: @route.waypoints[0][0].to_f
    # @forecast = open_weather_api.forecast lat: @route.waypoints[0][1].to_f, lon: @route.waypoints[0][0].to_f, cnt: 3
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

  def edit
    @route = Route.find(params[:id])
    authorize @route
  end

  def update
    @route = Route.find(params[:id])
    authorize @route
    if @route.update(route_params)
      if params[:route][:photos].present?
        params[:route][:photos].each do |uploaded_file|
          new_photo = @route.photos.build(user: current_user)
          new_photo.image.attach(uploaded_file)
          new_photo.save!
        end
      end
      redirect_to @route, notice: 'Route was successfully updated.'
    else
      render :edit
    end
  end

  private

  def route_params
    params.require(:route).permit(
      :title,
      :description,
      :address,
      :prefecture, :videos_url,
      :road_condition,
      waypoints: [],
      ride_type: [],
      recomended_bikes: []
    )
  end
end
