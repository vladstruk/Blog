class DeleteFromColumnArticleIdInComments < ActiveRecord::Migration
  def change
  	execute "DELETE FROM comments WHERE article_id IN(10,11)"
  end
end
