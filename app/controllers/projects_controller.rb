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
    @project = Project.new(name: project_params[:name], founder: current_user)
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
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = 'プロジェクトを削除しました。'
    redirect_to current_user
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name)
  end
end
