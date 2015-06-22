class Rating < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :user_id, scope: :article_id
  #validates :vote, :numericality => { :equal_to => 1, :equal_to => -1 }
  validates :vote, inclusion: [1, -1]

end