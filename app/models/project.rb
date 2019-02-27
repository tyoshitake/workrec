class Project < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 100 },
                   uniqueness: { case_sensitive: true }
  
  has_many :reverses_of_work, class_name: 'Work', foreign_key: 'project_id'
  has_many :members, through: :reverses_of_work, source: :user
  
  def get_members
    @members = self.members.order(:id)
  end
  
  def join(user)
    user.works.find_or_create_by(project_id: self.id)
  end
end
