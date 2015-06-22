class Setting < ActiveRecord::Base

  validates :value, presence: true
  validates :value, inclusion: { in: %w( on off ) }

end