class UsersController < ApplicationController
  def show
    @user = user(params[:id])
    @books = @user.books
  end

  def edit
    @user = user(params[:id])
  end

  def update
    @user = user(params[:id])
    @user.update
    redirect_to user_path
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
