class Work < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :user, presence: true
  validates :project, presence: true
  has_many :worktimes, dependent: :destroy
  
end
