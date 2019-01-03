class UserActivitiesController < ApplicationController

  before_action :authorized, only: [:new, :create, :update]
  
  def new
    @user_activities = UserActivity.new
  end

  def create
    @user_activity = UserActivity.new(user_activity_params)
    @user_activity.user_id = current_user.id if current_user
    @user_activity.save
    redirect_to user_path(@user_activity.user)
  end

  def edit

  end

  def update
  end

  def delete
  end


  private
  def user_activity_params
      params.require(:user_activity).permit(:user_id,:activity_id,:mins_active)
  end
end
