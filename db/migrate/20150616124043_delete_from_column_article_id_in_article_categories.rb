class DeleteFromColumnArticleIdInArticleCategories < ActiveRecord::Migration
  def change
  	execute "DELETE FROM article_categories WHERE article_id IN(9,10,11,12,14)"
  end
end
