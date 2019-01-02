class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def food
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

  def edit
    @user = User.find(params[:id])
  end

  def add_food
    byebug
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :height, :weight,
<<<<<<< HEAD
      :gender, :age, :email, :password, :user_setting)
=======
      :gender, :age, :email, :password, :user_setting, food_ids:[],foods_attributes:[:name,:calories])
>>>>>>> fb6abde64a0c3041c7f0c47e42c89bb000b86b02
  end
#update user params to be custom for different methods
end
