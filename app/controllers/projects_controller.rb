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
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "Project added!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: "Project edited!" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path, notice: "Project deleted"
  end

  private

  def project_params
    params.require(:project).permit(:name, :developer_id, :time_entry_id, :max_allowed_hours)
  end
end
