class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :ensure_user

  def ensure_user
    redirect_to new_session_path unless current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
