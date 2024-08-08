class ReviewsController < ApplicationController
before_action :set_route

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end
  def create
    @review = @route.reviews.build(review_params)
    @review.user = current_user 
    authorize @review  # Pundit authorization

    if @review.save
      Rails.logger.info "Review was successfully saved."
      redirect_to @route, notice: 'Review was successfully created.'
    else
      Rails.logger.error "Failed to save review. Errors: #{@review.errors.full_messages.join(', ')}"
      render 'routes/show', status: :unprocessable_entity
    end
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def review_params
    params.require(:review).permit(:date, :title, :description, :rating, :videos_url, :used_bike, :road_condition, :bike_id, photos: [])
  end
end
