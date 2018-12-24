class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    @user = User.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:gender,:food_id)
  end
end
