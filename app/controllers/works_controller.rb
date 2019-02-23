class WorksController < ApplicationController
  def create
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
