class PagesController < ApplicationController
  after_action :verify_authorized, except: :home

  def home
    @bikes = current_user.bikes
    @routes = Route.all
    @ride_types = Route::RIDE_TYPE
  end
end
