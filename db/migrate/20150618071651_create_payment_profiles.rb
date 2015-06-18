class CreatePaymentProfiles < ActiveRecord::Migration
  def change
    create_table :payment_profiles do |t|
    	t.integer :user_id
    	t.integer :subscription_id
    	t.integer :card_number
    	t.integer :cvv
    	t.date :expiry_date
    end
  end
end
