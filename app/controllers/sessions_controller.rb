class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      flash.now[:success] = "Welcome back to FitBite!"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render :new
    end
  end

  def destroy
    #PROBLEM WITH LOGOUT -NO ROUTE MATCH "/logout"
    log_out
    redirect_to users_path
  end
end
