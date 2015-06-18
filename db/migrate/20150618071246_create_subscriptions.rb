class CreateSubscriptions < ActiveRecord::Migration
  def change
  	create_table :subscriptions do |t|
      t.string :name
      t.integer :period
      t.integer :price
      t.timestamps null: false
    end
  end
end