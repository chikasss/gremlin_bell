class ReviewsController < ApplicationController
before_action :authenticate_user!

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.route = Route.find(params[:route_id])
    @review.user = current_user
    if @review.save
      redirect_to route_path(@review.route)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:date, :title, :description, :rating, :videos_url, :used_bike, :road_condition)
  end
end
