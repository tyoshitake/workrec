class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end
  
  def show
    @project = Project.find(params[:id])
    @members = @project.get_members
  end
  
  def new
  end

  def create
  end
end
