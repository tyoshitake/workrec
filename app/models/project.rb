class Project < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 },
                   uniqueness: { case_sensitive: true }
  
  has_many :reverses_of_work, class_name: 'Work', foreign_key: 'user_id'
  has_many :members, through: :reverses_of_work, source: :user
end
