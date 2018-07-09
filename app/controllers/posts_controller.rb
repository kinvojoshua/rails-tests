class PostsController < ApplicationController
  def index
    @posts = Post.all()
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(permitted_params)
    redirect_to posts_path
  end

  private
  def permitted_params
    params.require(:post).permit([:title, :body, :status])
  end
end
