class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_route

  def create
    @photo = @route.photos.build(photo_params)
    @photo.user = current_user
    authorize @photo

    if photo_params[:image].size > 10.megabytes
      redirect_to @route, alert: "File size too large. Maximum allowed size is 10MB."
      return
    end

    if !photo_params[:image].content_type.in?(%w(image/jpeg image/png))
      redirect_to @route, alert: "File type is invalid. Only JPEG and PNG are allowed."
      return
    end

    if @photo.save
      redirect_to @route, notice: 'Photo was successfully added.'
    else
      redirect_to @route, alert: @photo.errors.full_messages.to_sentence
    end
  end

  def index
    @photos = policy_scope(@route.photos)
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end
