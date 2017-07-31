class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    login_user!(@user)
  end

  def destroy
    @user = current_user
    @user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_sessions_url
  end

end
