class AddColumnsToPaymentProfiles < ActiveRecord::Migration
  def change
  	add_column :payment_profiles, :created_at, :datetime
		add_column :payment_profiles, :updated_at, :datetime
  end
end
