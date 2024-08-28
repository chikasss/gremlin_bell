class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_user, only: [:edit, :update, :show, :saved_trips]
  after_action :verify_authorized, except: :home

  def home
    if user_signed_in?
      @post = Post.new
      @posts = Post.where(user_id: current_user.following.pluck(:id) + [current_user.id]).order(created_at: :desc).to_a
      followed_users_ids = current_user.following.pluck(:id)
      @users = User.where.not(id: current_user.following.pluck(:id) + [current_user.id])
              .order(created_at: :desc)
              .limit(5)
      @routes = Route.where(user_id: followed_users_ids).order(created_at: :desc).to_a
      @reviews = Review.where(user_id: followed_users_ids).order(created_at: :desc).to_a
      @bikes = Bike.where(user_id: followed_users_ids).order(created_at: :desc).to_a
      @comments = Comment.where(user_id: followed_users_ids).order(created_at: :desc).to_a

      @routes_with_photos = Photo.includes(:route, :user).where(route: { user_id: followed_users_ids }).map do |photo|
        { route: photo.route, photo: photo, user: photo.user }
      end

      # sorted by created_at and shuffled
      @feed_items = (@routes + @reviews + @bikes + @comments + @routes_with_photos + @posts)
      .group_by do |item|
        item.is_a?(Hash) ? item[:route].created_at : item.created_at
      end
      .flat_map do |created_at, items|
        items.shuffle
      end
      .sort_by { |item| item.is_a?(Hash) ? item[:route].created_at : item.created_at }
      .reverse

    else
      @routes = []
      @reviews = []
      @bikes = []
      @comments = []
      @feed_items = []
      @posts = []
    end
  end
end
