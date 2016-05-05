class TimeEntriesController < ApplicationController
  before_action :authenticate!

  def index
    @time_entries = TimeEntry.all
  end

  def show
    @time_entry = TimeEntry.find(params[:id])
  end

  def new
    @time_entry = TimeEntry.new
    @time_entry.developer_id = current_user.id
  end

  def create
    @time_entry = TimeEntry.create!(time_entry_params)
    redirect_to time_entries_path, notice: "Time entry added"
  end

  def edit
    @time_entry = TimeEntry.find(params[:id])
  end

  def update
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.update(time_entry_params)
    redirect_to time_entry_path(@time_entry), notice: "Time entry updated"
  end

  def destroy
    TimeEntry.find(params[:id]).destroy
    redirect_to root_path, notice: "Time entry deleted"
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:subject, :start_time, :end_time, :project_id, :developer_id)
  end
end
