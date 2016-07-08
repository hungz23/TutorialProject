class UsersController < ApplicationController
  def new
  end
  def show
  	@user = User.find(params[:id])
  end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  def is_logged_in?
    !session[:user_id].nil?
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
