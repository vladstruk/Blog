class Subscription < ActiveRecord::Base

	#in days
	TRIAL_PERIOD = 14

	has_many :payment_profiles

	validates :name, presence: true, uniqueness: true
	validates :period, presence: true
	validates :price, presence: true

end
