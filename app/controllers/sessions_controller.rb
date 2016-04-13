class SessionsController < ApplicationController

  def new
    # @user = User.new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid Login, Please Try Again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end
end
