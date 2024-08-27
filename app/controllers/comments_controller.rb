class CommentsController < ApplicationController
  # def create
  #   @route = Route.find(params[:route_id])
  #   @comment = @route.comments.new(comment_params)
  #   @comment.user = current_user
    
  #   authorize @comment

  #   if @comment.save
  #     redirect_to @route
  #   else
  #     render 'routes/show'
  #   end
  # end

  def create
    if params[:route_id]
      @commentable = Route.find(params[:route_id])
    elsif params[:post_id]
      @commentable = Post.find(params[:post_id])
    else
      redirect_to root_path, alert: "Comentário inválido."
      return
    end

    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    authorize @comment

    if @comment.save
      redirect_to @commentable # Redireciona para a rota ou post
    else
      flash[:alert] = "Não foi possível postar o comentário. Por favor, tente novamente."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
