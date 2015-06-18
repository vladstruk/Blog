class SessionsController < ApplicationController

  skip_before_filter :login_required, only: [:new, :create]

  def create
    user = User.by_login_data(params[:session])
    if user.try(:active?)
  	  session[:user_id] = user.id
      if user.has_access?
  	  flash[:notice] = "You entered to the site!" 
      redirect_to articles_path
      else
        flash[:error] = "You have to choose one of the subscriptions."
        redirect_to subscriptions_path
      end
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
