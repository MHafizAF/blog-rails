class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index 
    user = User.find(current_user.id)
    @posts = user.posts.all 
  end

  def show
    @comments = Comment.joins(:user).where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save 
      redirect_to root_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private 

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params 
    params.require(:post).permit(:title, :body)
  end
end
