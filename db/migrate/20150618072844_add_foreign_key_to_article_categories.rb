class AddForeignKeyToArticleCategories < ActiveRecord::Migration
  def change
  	add_foreign_key :article_categories, :articles
  	add_foreign_key :article_categories, :categories
  end
end
