class Admin::SettingsController < ApplicationController

	def index
		@settings = Setting.all
	end

	def update
		@setting = Setting.find_by_id(params[:id])
		if @setting
		  if @setting.update_attributes(settings_params)
		  	flash[:notice] = "Settings updated successfully."
		  else
		  	flash[:error] = "Something went wrong"
		  end
		redirect_to admin_settings_path
		else
      render_404
		end
	end

	private

	def settings_params
	  params.require(:setting).permit(:name, :value)
	end

end