class UsersController < ApplicationController

	def new
	  @user = User.new
	end

	def create
        user = User.new(users_params)
        user.role = "blogger"
        if user.save
        	flash[:notice] = "You signed up successfully! Use link in your email to confirm."
        	UsersMailer.activate(user).deliver
        	redirect_to articles_path
        else
        	redirect_to new_user_path
        end
	end

	private

	def users_params
	  params.require(:user).permit(:name, :email, :password)
	end
end
