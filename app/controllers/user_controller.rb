class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".Sign_Up_Success"
      redirect_to "/login"
    else
      flash[:error] = t ".registration_failed"
      render :new
    end
    # redirect_to "/login"
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password, :confirm
  end

  def logged_in_user
      return if logged_in?
      store_location
      flash[:danger] = t "please_login"
      redirect_to login_url
  end
end
