class PaymentProfilesController < ApplicationController

  before_filter :find_subscription, only: [:new, :create]

  def new
    if @subscription && current_user.payment_profile.nil?
     @payment_profile = PaymentProfile.new
    else
      flash[:error] = "You are already subscribed."
      redirect_to subscriptions_path
    end
  end

  def create
    if @subscription
      @payment_profile = @subscription.payment_profiles.build(payment_profiles_params)
      @payment_profile.user = current_user
      if @payment_profile.save
        flash[:notice] = "You subscribed well."
        redirect_to articles_path
      else
        flash[:error] = "Something went wrong."
        render :new
      end
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  private

  def payment_profiles_params
    params.require(:payment_profile).permit(:card_number, :cvv, :expiry_date)
  end

  def find_subscription
    @subscription = Subscription.find_by_id(params[:subscription_id])
  end
	
end