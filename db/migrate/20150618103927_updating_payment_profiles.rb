class UpdatingPaymentProfiles < ActiveRecord::Migration
  def change
  	add_column :payment_profiles, :subscribed_at, :datetime
  	execute "UPDATE payment_profiles SET subscribed_at = NOW()"
  	add_foreign_key :payment_profiles, :users
  	add_foreign_key :payment_profiles, :subscriptions
  	change_column :payment_profiles, :subscription_id, :integer, null: false
  	change_column :payment_profiles, :subscribed_at, :datetime, null: false
  end
end
