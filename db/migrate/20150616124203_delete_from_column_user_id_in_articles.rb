class DeleteFromColumnUserIdInArticles < ActiveRecord::Migration
  def change
  	execute "DELETE FROM articles WHERE user_id is NULL"
  end
end
