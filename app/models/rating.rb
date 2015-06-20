class Rating < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :user_id, scope: :article_id

end