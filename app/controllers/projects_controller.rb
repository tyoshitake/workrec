class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end
  
  def show
    @project = Project.find(params[:id])
    @members = @project.get_members
    @work = Work.new
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @work = Work.new(user: current_user, project: @project)
      if @work.save
        flash[:success] = '新しいプロジェクトを作成しました。'
        redirect_to current_user
      else
        @project.destroy
        flash.now[:danger] = '新しいプロジェクトの作成に失敗しました。'
        render :new
      end
    else
      flash.now[:danger] = '新しいプロジェクトの作成に失敗しました。'
      render :new
    end
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name)
  end
end
