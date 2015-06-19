class PaymentProfilesController < ApplicationController

  skip_before_filter :access_required

  before_filter :find_subscription

  def new
    if @subscription 
      @payment_profile = current_user.payment_profile || PaymentProfile.new
    else
      render_404
    end
  end

  def create
    if @subscription
      @payment_profile = current_user.build_payment_profile(payment_profiles_params)
      @payment_profile.subscription = @subscription
      @payment_profile.save
      response_after_save
    else
      render_404
    end
  end

  def update
    if @subscription && @payment_profile = PaymentProfile.find_by_id(params[:id])
      @payment_profile.subscription = @subscription
      @payment_profile.update_attributes(payment_profiles_params)
      response_after_save
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

  def response_after_save
    session[:expiry_time] = current_user.expiry_time
    if @payment_profile.errors.any?
      flash[:error] = "Something went wrong."
      render :new
    else   
      flash[:notice] = "You subscribed well."
      redirect_to articles_path
    end
  end

end