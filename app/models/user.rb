class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :works
  has_many :projects, through: :works, source: :project
  
  def join_to_project(project)
    self.works.find_or_create_by(project_id: project.id)
  end
  
  def is_member?(project)
    self.projects.include?(project)
  end
end
