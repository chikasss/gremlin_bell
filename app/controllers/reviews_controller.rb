class ReviewsController < ApplicationController
before_action :set_route, only: [:new, :create, :edit, :update, :index]

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def index
    @reviews = policy_scope(@route.reviews)
    authorize @reviews
  end
  
  def create
    @review = @route.reviews.build(review_params)
    @review.user = current_user
    authorize @review

    if @review.save
      Rails.logger.info "Review was successfully saved."
      redirect_to @route, notice: 'Review was successfully created.'
    else
      Rails.logger.error "Failed to save review. Errors: #{@review.errors.full_messages.join(', ')}"
      flash.now[:alert] = "There were errors with your submission."
      render 'routes/show', status: :unprocessable_entity
    end
  end

  def edit
    @review = @route.reviews.find(params[:id])
    authorize @review
  end

  def show
    @review = Review.find(params[:id])
    @route = @review.route
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    authorize @review  # Pundit authorization

    if @review.update(review_params)
      redirect_to @route, notice: 'Review was successfully updated.'
    else
      Rails.logger.error "Failed to update review. Errors: #{review.errors.full_messages.join(', ')}"
      render :edit, status: :unprocessable_entity
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
