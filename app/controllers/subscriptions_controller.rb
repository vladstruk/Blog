class SubscriptionsController < ApplicationController

	skip_before_filter :access_required, only: [:index]

	def index
		@subscriptions = Subscription.all
	end
  
end