class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    User.create(permitted_params)
    redirect_to users_path
  end

  private
  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :middle_name, :email, :password_hash)
  end
end
