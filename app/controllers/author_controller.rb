class AuthorController < ApplicationController

  def index
    @authors = Author.all()
  end

  def new
    @author = Author.new()
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.create(author_params)
  end

  private
   def author_params
     params.require(:author).permit(:name)
   end
end
