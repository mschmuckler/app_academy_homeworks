class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    session[:session_token] = @user.session_token

    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver_now

      login_user!(@user)
      return
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
