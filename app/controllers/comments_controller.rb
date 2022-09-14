class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[edit update destroy]

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

  def edit 
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_url(@comment.post_id)
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy 
    @comment.destroy 

    redirect_to posts_path
  end

  private 

  def set_comment
    begin
      @comment = Comment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def comment_params 
    params.require(:comment).permit(:comment)
  end
end
