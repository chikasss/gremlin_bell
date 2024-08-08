class CommentsController < ApplicationController
  def create
    @route = Route.find(params[:route_id])
    @comment = @route.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment

    if @comment.save
      redirect_to @route
    else
      render 'routes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
