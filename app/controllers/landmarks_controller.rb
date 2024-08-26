class LandmarksController < ApplicationController

  def new
    @landmark = Landmark.new
    @landmark.build_route
  end

  def create
    @route = Route.find(params[:route_id])
    @landmark = @route.landmarks.new(landmark_params)
    #landmark.route = @route
    @landmark.save
    @coordinates = [@landmark.long, @landmark.lat]
    # if @landmark.save
    #   respond_to do |format|
    #     format.text { render partial: "landmarks/landmark_card", locals: {landmark: @landmark}, formats: [:html] }
    #   end
    # end
  end

  private

  def landmark_params
    params.require(:landmark).permit(:address, :lat, :long, :title)
  end
end
