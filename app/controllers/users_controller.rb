class UsersController < ApplicationController
  # def index
  #   @user = current_user
  # end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )
    if @user.save
      flash[:notice] = "User successfully created."
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.erros.full_messages.join(", ")
      render :new
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end
end
