class Workingtime < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :workingtime_m, presence: true,
            grater_than: 0,
            less_than_or_equal_to: 1440
  
  validates :datetime, presence: true
end
