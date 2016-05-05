class TimeEntriesController < ApplicationController
  before_action :authenticate!

  def index
    @time_entries = current_user.time_entries
  end

  def show
    @time_entry = TimeEntry.find(params[:id])
  end

  def new
    @time_entry = TimeEntry.new
    @time_entry.developer_id = current_user.id
    # @time_entry.duration = @time_entry.calculate_duration
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
    @time_entry = TimeEntry.find(params[:id])

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to time_entries_path, notice: "Time entry added!" }
      else
        format.html { render :edit }
      end
    end
  end

  def update
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.update(time_entry_params)
    redirect_to time_entry_path(@time_entry), notice: "Time entry updated"
  end

  def destroy
    TimeEntry.find(params[:id]).destroy
    redirect_to time_entries_path, notice: "Time entry deleted"
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:subject, :duration, :project_id, :developer_id)
  end
end
