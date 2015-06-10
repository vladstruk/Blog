class UsersController < ApplicationController

	skip_before_filter :login_required, only: [:new, :create, :activation]

    def index
      @users = User.all
    end

	def new
	  @user = User.new
	end

	def create
        @user = User.new(users_params)
        @user.role = "blogger"
        @user.activation_code = SecureRandom.hex
        if @user.save
        	flash[:notice] = "You signed up successfully! Use link in your email to confirm."

        	UsersMailer.activate(@user).deliver
        	redirect_to new_session_path
        else
        	render :new
        end
	end

	def show
	  @user = User.find_by_id(params[:id])
	end

	def activation
	  user = User.find_by_activation_code(params[:activation_code])
	  binding.pry
	  if user.try(:update_attributes, active: true)
	  		  binding.pry
	  	session[:user_id] = user.id
	  	flash[:notice] = "You activated your account successfully!"
        redirect_to articles_path
	  else
        flash[:error] = "Something went wrong. You can't activate your account."
        redirect_to new_user_path
	  end
	end

	private

	def users_params
	  params.require(:user).permit(:name, :email, :password)
	end
end
