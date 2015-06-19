class PaymentProfile < ActiveRecord::Base

	belongs_to :user
	belongs_to :subscription
  
  validates :card_number, presence:true, numericality: true
  validates :cvv, presence:true, numericality: true
  validates :expiry_date, presence: true
  validates :subscription, presence: true
  validates :subscribed_at, presence: true
  
  def expiry_time
    if (Time.now.utc - subscribed_at)/1.day <= subscription.period
      subscribed_at + subscription.period.days
    end
  end
  
  def subscription= arg
    self.subscribed_at = Time.now.utc
    super arg
  end
end