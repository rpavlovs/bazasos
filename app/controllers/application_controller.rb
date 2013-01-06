class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ensure_user
  helper_method :current_user
  helper_method :admin?

  def ensure_user
    redirect_to new_session_path unless current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    @current_user.try(:admin?)
  end

  def check_permissions
    render 'shared/forbidden', status: :forbidden unless admin?
  end
end
