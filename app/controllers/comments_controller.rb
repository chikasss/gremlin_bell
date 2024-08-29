class CommentsController < ApplicationController

  def create
    if params[:route_id]
      @commentable = Route.find(params[:route_id])
    elsif params[:post_id]
      @commentable = Post.find(params[:post_id])
    else
      redirect_to root_path, alert: "Invalid comment."
      return
    end

    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment

    if @comment.save
      if @commentable.is_a?(Post)
        @commentable.increment!(:comments_count)
      end
      redirect_to user_post_path(@commentable.user, @commentable)
    else
      flash[:alert] = "Unable to post comment. Please try again."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
