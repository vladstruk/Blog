class Comment < ActiveRecord::Base
  
  belongs_to :user, dependent: :destroy
  belongs_to :article, dependent: :destroy

  validates :content, presence: true

end
