class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :works
  has_many :projects, through: :works, source: :project
  has_many :workingtimes
  
  def is_member?(project)
    self.projects.include?(project)
  end
  
  def get_work(project)
    @work = Work.find_by(user_id: self.id, project_id: project.id)
  end
end
