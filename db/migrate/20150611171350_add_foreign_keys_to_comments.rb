class AddForeignKeysToComments < ActiveRecord::Migration
  def change
  	add_foreign_key :comments, :users
  	add_foreign_key :comments, :articles
  end
end
