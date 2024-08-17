class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_user, only: [:edit, :update, :show, :saved_trips]
  after_action :verify_authorized, except: :home

  def home
    if user_signed_in?
    # @bikes = current_user.bikes
    @routes = Route.all.order(created_at: :desc)
    # @saved_trips = current_user.all_favorited
    
    followed_users_ids = current_user.following.pluck(:id)
    @routes = Route.where(user_id: followed_users_ids).order(created_at: :desc).last(10)
    @routes_with_photos = @routes.select { |route| route.photos.attached? }.last(10)
    @users = User.where.not(id: current_user.following.pluck(:id)).order(created_at: :desc).limit(5)
    @reviews = Review.where(user_id: followed_users_ids).order(created_at: :desc).limit(10)
    @bikes = Bike.where(user_id: followed_users_ids).order(created_at: :desc).limit(10)
    @coments = Comment.where(user_id: followed_users_ids).order(created_at: :desc).limit(10)
    else
      @routes = Route.none
      @routes_with_photos = []
      @users = User.none
      @bikes = Bike.none
      @reviews = Review.none
    end
  end
end
