class Article < ActiveRecord::Base

  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  def self.order_by params
	sql = sanitize_sql_array(["%s %s", params[:field], params[:direction]])
  	Article.order(sql)
  end

end
