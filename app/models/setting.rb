class Setting < ActiveRecord::Base

  validates :value, presence: true

end