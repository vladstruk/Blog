class PaymentProfile < ActiveRecord::Base

	belongs_to :user
	belongs_to :subscription
  
  validates :card_number, presence:true, numericality: true
  validates :cvv, presence:true, numericality: true
  validates :expiry_date, presence: true

end