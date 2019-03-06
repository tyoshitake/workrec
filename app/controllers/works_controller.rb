class WorksController < ApplicationController
  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = 'プロジェクトに加入しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'プロジェクトの加入に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @work = Work.find_by(user_id: params[:user_id], project_id: params[:project_id])
    @work.destroy
    flash[:success] = 'プロジェクトから脱退しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def work_params
    params.require(:work).permit(:user_id, :project_id)
  end
end
