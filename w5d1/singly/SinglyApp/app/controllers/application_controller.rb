class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to bands_url
    else
      flash[:errors] = "Invalid credentials"
      redirect_to new_sessions_url
      return
    end
  end

  def signed_in?
    return true if current_user
    false
  end

  def redirect_to_login_if_signed_out
    redirect_to new_sessions_url unless signed_in?
  end

end
