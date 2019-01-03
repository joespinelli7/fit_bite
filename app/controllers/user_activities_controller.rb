class UserActivitiesController < ApplicationController

 

  def new
    @user_activity = UserActivity.new
  end

  def create
    @user_activity = UserActivity.new(user_activity_params)
    @user_activity.user_id = current_user.id if current_user
    @user_activity.save
    redirect_to user_path(@user_activity.user)
  end

  def edit
    @user_activity = UserActivity.find(params[:id])
  end

  def update
    @user_activity = UserActivity.find(params[:id])
    @user_activity.update(user_activity_params)
    redirect_to user_path(@user_activity.user)
  end

  def remove
    @user_activity = UserActivity.find(params[:id])
  end

  def destroy
    @user_activity = UserActivity.find(params[:id])
    @user_activity.destroy
    redirect_to user_path(@user_activity.user)
  end

  private
  def user_activity_params
      params.require(:user_activity).permit(:user_id,:activity_id,:mins_active)
  end
end
