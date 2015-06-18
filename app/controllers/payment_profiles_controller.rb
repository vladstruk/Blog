class PaymentProfilesController < ApplicationController

  before_filter :find_subscription, only: [:new, :create, :update]

  def new
    if @subscription 
      @payment_profile = current_user.payment_profile || PaymentProfile.new
    else
      render_404
    end
  end

  def create
    if @subscription
      @payment_profile = current_user.payment_profiles.build(payment_profiles_params)
      @payment_profile.subscription = @subscription
      @payment_profile.subscribed_at = Time.now.utc
      if @payment_profile.save
        flash[:notice] = "You subscribed well."
        redirect_to articles_path
      else
        flash[:error] = "Something went wrong."
        render :new
      end
    else
      render_404
    end
  end

  def update
    if @subscription && @payment_profile = PaymentProfile.find_by_id(params[:id])
      @payment_profile.subscription = @subscription
      @payment_profile.subscribed_at = Time.now.utc
      if @payment_profile.update_attributes(payment_profiles_params)
        flash[:notice] = "You subscribed well."
        redirect_to articles_path
      else
        flash[:error] = "Something went wrong."
        render :new 
      end
    else
      render_404
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