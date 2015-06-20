class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.boolean :vote
    	t.integer :article_id
    	t.integer :user_id
    end

    add_index :ratings, [:user_id, :article_id], unique: true
    add_foreign_key :ratings, :users
    add_foreign_key :ratings, :articles
  end
end
