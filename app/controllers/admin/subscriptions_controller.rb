class Admin::SubscriptionsController < ApplicationController
  
	authorize_resource only: [:new, :create]

	def new
		@subscription = Subscription.new
	end

	def create
		@subscription = Subscription.new(subscriptions_params)
		if @subscription.save
     redirect_to subscriptions_path
		else
			flash[:error] = "Something went wrong."
			render :new
		end
	end

	private

	def subscriptions_params
	  params.require(:subscription).permit(:name, :period, :price)
	end
  
end