class AddIndexesToDatabaseTablesColumns < ActiveRecord::Migration
  def change
  	add_index :payment_profiles, :user_id, unique: true
		add_index :payment_profiles, [:user_id, :subscription_id], unique: true
		add_index :article_categories, [:article_id, :category_id], unique: true 	
		add_index :subscriptions, :name, unique: true
		add_index :categories, :name, unique: true
  end
end
