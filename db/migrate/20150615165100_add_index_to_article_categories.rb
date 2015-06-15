class AddIndexToArticleCategories < ActiveRecord::Migration
  def change
  	add_index :article_categories, [:article_id, :category_id]
  end
end
