class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :login_required

  helper_method :current_user

  def current_user
  	@_current_user ||= User.find_by_id(session[:user_id])
  end

  def login_required
  	return unless current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to articles_path, :alert => exception.message
  end
end