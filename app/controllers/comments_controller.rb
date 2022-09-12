class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
    @post_id = params[:id]
  end

  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id, post_id: params[:post_id]))
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @comment.destroy 

    redirect_to posts_url
  end

  private 

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params 
    params.require(:comment).permit(:comment)
  end
end
