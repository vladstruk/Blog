class Subscription < ActiveRecord::Base

	has_many :payment_profiles

	validates :name, presence: true, uniqueness: true
	validates :period, presence: true
	validates :price, presence: true

	def active? user
    (Time.now - user.payment_profile.created_at)/1.day <= period
  end 

end
