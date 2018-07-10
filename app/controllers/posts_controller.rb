class PostsController < ApplicationController
  before_action  :find_post_by_id, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all()
  end

  def show
  
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(permitted_params)
    redirect_to posts_path
  end

  def edit
  
  end
  
  def destroy
    @post.destroy
    redirect_to @post
  end

  def update
    @post.update(permitted_params)
    redirect_to posts_path
  end

  private
  def permitted_params
    params.require(:post).permit([:title, :body, :status])
  end

  def find_post_by_id
    @post = Post.find(params[:id])
  end
end
