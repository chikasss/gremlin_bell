class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:like, :unlike]

  def new
    @user = current_user
    @post = Post.new
    authorize @post
  end
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.tags = params[:post][:tags].split(',').map(&:strip) if params[:post][:tags].present?
    @post.content = process_mentions(@post.content)
    authorize @post
    Rails.logger.debug { @post.inspect }

    if @post.save
      if request.referer == root_url
        redirect_to root_path
      else
        redirect_to user_post_path(@post.user, @post)
      end
    else
      flash[:alert] = "Unable to create post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.tags = process_tags(params[:post][:tags])
    
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def index
    @user = User.find(params[:user_id])
    @posts = policy_scope(Post)
            .where(user_id: @user.id)
            .includes(:user)
            .order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    authorize @post
  end

  def search
    if params[:tag]
      @posts = Post.where("tags @> ARRAY[?]::varchar[]", params[:tag])
    else
      @posts = Post.all
    end
    authorize @posts
  end

  def like
    @post.favorite(current_user)
  
    respond_to do |format|
      format.html { redirect_to @post }
      format.json {
        render json: {
          likes_count: @post.likes_count,
          like_button_html: render_to_string(partial: "components/like_button", locals: { post: @post }, formats: [:html])
        }
      }
    end
    authorize @post
  end

  def unlike
    @post.unfavorite(current_user)

    respond_to do |format|
      format.html { redirect_to @post }
      format.json {
        render json: {
          likes_count: @post.likes_count,
          like_button_html: render_to_string(partial: "components/like_button", locals: { post: @post }, formats: [:html])
        }
      }
    end
    authorize @post
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def process_mentions(content)
    mentions = []
  
    processed_content = content.gsub(/@\[(.+?)\]|@(\w+)/) do |match|
      route_or_user_name = $1 || $2
  
      if $1
        route = Route.where("LOWER(title) = ?", route_or_user_name.downcase).first
        if route
          mentions << route.title
          "<a href='#{route_path(route)}'>@#{route.title}</a>"
        else
          match
        end
      elsif $2
        user = User.find_by(username: route_or_user_name)
        if user
          mentions << user.username
          "<a href='#{user_path(user)}'>@#{user.username}</a>"
        else
          match
        end
      else
        match
      end
    end
    @post.mentions = mentions if @post.respond_to?(:mentions)
    processed_content
  end


  def process_tags(tags_string)
    tags_string.split(',').map { |tag| tag.strip.downcase.gsub(/\s+/, '-') }
  end  

  def post_params
    params.require(:post).permit(
      :title, 
      :content, 
      :visibility, 
      :image_url, 
      :location, 
      :status, 
      :media_url, 
      :parent_post_id, 
      :likes_count, 
      :comments_count,
      tags: [], 
      mentions: [],
      images: []
    )
  end  
end
