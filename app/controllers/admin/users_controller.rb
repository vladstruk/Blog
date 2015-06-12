class Admin::UsersController < ApplicationController

  load_resource only: [:show, :update]
  authorize_resource only: [:index, :show, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def update
	@user.update_attributes(role: params[:user][:role])
	render :show
  end
end