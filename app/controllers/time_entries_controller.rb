class TimeEntriesController < ApplicationController
  before_action :authenticate!
  before_action :set_time_entry, only: [:show, :edit, :update, :destroy]

  def index
    @time_entries = current_user.time_entries
  end

  def show
  end

  def new
    @time_entry = current_user.time_entries.build
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to time_entries_path, notice: "Time entry added!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @time_entry.update(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to time_entries_path, notice: "Time entry changed!" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    time_entry.destroy
    redirect_to time_entries_path, notice: "Time entry deleted"
  end

  private

  def set_time_entry
    @time_entry = TimeEntry.find(params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:subject, :duration, :project_id, :developer_id)
  end
end
