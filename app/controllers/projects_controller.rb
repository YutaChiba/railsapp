class ProjectsController < ApplicationController
  
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end
    
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end
  
  # パラメータのフィルタリング
  private def project_params
    # titleだけアクセス許可
      params[:project].permit(:title)
    end
  
end
