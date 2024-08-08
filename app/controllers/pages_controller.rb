class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  after_action :verify_authorized, except: :home

  def home
    @bikes = current_user.bikes
  end
end
