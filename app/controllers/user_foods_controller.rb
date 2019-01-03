class UserFoodsController < ApplicationController

  before_action :authorized, only: [:new, :create, :update]

  def new
    @user_food = UserFood.new
  end

  def create
    @user_food = UserFood.new(user_foods_params)
    @user_food.user_id = current_user.id if current_user
    @user_food.save
    redirect_to user_path(@user_food.user)
  end

  def edit
    @user_food = UserFood.find(params[:id])
  end

  def update
    @user_food = UserFood.find(params[:id])
    @user_food.update(user_foods_params)
    redirect_to user_path(@user_food.user)
  end

  def remove
    @user_food = UserFood.find(params[:id])
  end

  def destroy
    @user_food = UserFood.find(params[:id])
    @user_food.destroy
    redirect_to user_path(@user_food.user)
  end

  private
  def user_foods_params
      params.require(:user_food).permit(:user_id,:food_id,:servings)
  end
end
