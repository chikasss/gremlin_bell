class RoutesController < ApplicationController

  def index
    @routes = Routes.All
  end
end
