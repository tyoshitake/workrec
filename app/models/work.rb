class Work < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  def get_project
    @project = Project.find_by(id: self.project_id)
  end
end
