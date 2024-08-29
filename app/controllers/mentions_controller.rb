class MentionsController < ApplicationController
  skip_after_action :verify_authorized, only: :search
  
  def search
    query = params[:query].downcase
    users = User.where("LOWER(username) LIKE ?", "%#{query}%")
    routes = Route.where("LOWER(title) LIKE ?", "%#{query}%")
    
    results = users.map { |u| { type: 'user', id: u.id, name: u.username } } +
              routes.map { |r| { type: 'route', id: r.id, name: r.title } }
    
    render json: results
  end
end
