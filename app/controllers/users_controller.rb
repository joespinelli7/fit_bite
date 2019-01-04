class UsersController < ApplicationController

  before_action :authorized, only: [:show,:edit,:update,:destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user.user_setting == false && @user != current_user
      flash[:error] = "ERROR! This profile is private, here is a list of public profiles you can visit"
      redirect_to users_path
    end
    food_today
    activity_today
    daily_goal
    goal
    food_calories
    total_calories_burned
    total_calories
    calorie_stats
  end



  def profile
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def profile
     @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to new_user_path
    end
  end

  def food_today
    @food_today = @user.user_foods.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def activity_today
    @activity_today = @user.user_activities.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

def daily_goal
  if @user.gender == "F"
    @daily_goal = 2000
  else
   @daily_goal = 3000
  end
end

def goal

  if @user.goal == "weight loss"
    @goal = @daily_goal - 500
  elsif @user.goal == "weight gain"
    @goal = @daily_goal+500
  else
    @goal = @daily_goal
  end
end

def food_calories
  @total_food_calories = @food_today.collect do |user_food|
    user_food.food.calories * user_food.servings.to_i
  end
  if !@total_food_calories.empty?
  @total_food_calories = @total_food_calories.inject(:+)
else
  @total_food_calories = 0
end
end

def total_calories_burned
  @total_calories_burned =  @activity_today.collect do |user_act|
    user_act.activity.calories_burned * user_act.mins_active
  end
  if !@total_calories_burned.empty?
  @total_calories_burned = @total_calories_burned.inject(:+)
  else
    @total_calories_burned = 0
  end
end

def total_calories
    @total_cal = @total_food_calories - @total_calories_burned
end


def calorie_stats
  if !@total_cal.nil?
    if @total_cal < @daily_goal
     @current_calories_message = "You have #{@goal - @total_cal} calories remaining today"
   else
    @current_calories_message= "You have exceeded your daily goal by #{@total_cal - @goal} calories"
   end
 end
end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :height, :weight,
      :gender, :age, :email, :password, :user_setting,:goal)
  end
#update user params to be custom for different methods
end
