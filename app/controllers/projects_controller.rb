class ProjectsController < ApplicationController
  before_action :authenticate!

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
    @project = Project.create!(project_params)
    redirect_to root_path, notice: "Project added"
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to developer_path(@project), notice: "Project updated"
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to root_path, notice: "Project deleted"
  end

  private

  def project_params
    params.require(:project).permit(:name, :developer_id, :time_entry_id, :max_allowed_hours)
  end
end
