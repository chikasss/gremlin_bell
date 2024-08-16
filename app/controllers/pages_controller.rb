class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_user, only: [:edit, :update, :show, :saved_trips]
  after_action :verify_authorized, except: :home

  def home
    # @bikes = current_user.bikes
    @routes = Route.all.order(created_at: :desc)
    # @saved_trips = current_user.all_favorited
  end
end
