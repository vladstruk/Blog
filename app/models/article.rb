class Article < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  def self.safe_sql params
  	sanitize_sql_array(["%s %s", params["field"], params["direction"]])
  end

end
