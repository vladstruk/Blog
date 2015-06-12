class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :login_required

  def current_user
  	@_current_user ||= User.find_by_id(session[:user_id])
  end

  def login_required
  	unless current_user.present?
      flash[:error] = "Access denied!"
      redirect_to new_session_path
    end
  end

  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to articles_path, :alert => exception.message
  #end

  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = exception.message  
    redirect_to articles_path
  end
end