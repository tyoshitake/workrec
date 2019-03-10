class Worktime < ApplicationRecord
  belongs_to :work
  
  validates :work, presence: true
  validates :time_m, presence: true,
                     numericality: { 
                       greater_than_or_equal_to: 0 ,
                       less_than_or_equal_to: 1440
                     }
  validates :date, presence: true
end
