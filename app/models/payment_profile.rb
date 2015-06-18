class PaymentProfile < ActiveRecord::Base

	belongs_to :user
	belongs_to :subscription
  
  validates :card_number, presence:true, numericality: true
  validates :cvv, presence:true, numericality: true
  validates :expiry_date, presence: true

  def has_active_subscription?
    (Time.now - created_at)/1.day <= subscription.period
  end 

end