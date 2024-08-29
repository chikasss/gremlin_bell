class SearchController < ApplicationController
  def index
    @query = params[:query]
    @users = policy_scope(User).where("first_name ILIKE :query OR last_name ILIKE :query OR username ILIKE :query", query: "%#{@query}%")
    @routes = policy_scope(Route).where("title ILIKE ?", "%#{@query}%")
  end

  def search
    @query = params[:query]
  
    @users = policy_scope(User)
                .where("first_name ILIKE :query OR last_name ILIKE :query OR username ILIKE :query", query: "%#{@query}%")
                .order(created_at: :desc)
    @routes = policy_scope(Route)
                .where("title ILIKE ?", "%#{@query}%")
                .order(created_at: :desc)
    @last_routes = policy_scope(Route).order(created_at: :desc).limit(5)
    @last_users = policy_scope(User).order(created_at: :desc).limit(5)
  
    authorize @users
    authorize @routes
  end
  
end
