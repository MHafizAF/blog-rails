class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ show ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index 
    @posts = Post.where(user_id: current_user.id)
  end

  def show
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
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def post_params 
    params.require(:post).permit(:title, :body)
  end
end
