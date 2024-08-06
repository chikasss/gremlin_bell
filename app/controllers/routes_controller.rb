class RoutesController < ApplicationController
  before_action :authenticate_user!

  def new
    @route = Route.new
    authorize @route
  end

  def index
    @routes = policy_scope(Route)
  end
end
