class LandmarksController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @landmark = Landmark.new(landmark_params)
    @landmark.route = @route
    if @landmark.save
      respond_to do |format|
        format.text { render partial: "landmarks/landmark_card", locals: {landmark: @landmark}, formats: [:html] }
      end
    end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:name, :long, :lat)
  end
end
