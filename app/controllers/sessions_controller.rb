class SessionsController < ApplicationController

  skip_before_filter :login_required, only: [:new, :create]
  skip_before_filter :access_required


  def create
    user = User.by_login_data(params[:session])
    if user.try(:active?)
  	  session[:user_id] = user.id
      session[:expiry_time] = user.expiry_time
      redirect_to articles_path
  	else
  	  flash[:error] = "Access denied!"
  	  redirect_to new_session_path
  	end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out."
    redirect_to new_session_path
  end
	
end
