class RemoveStartEndTimeFromTimeEntries < ActiveRecord::Migration
  def change
    remove_column :time_entries, :start_time
    remove_column :time_entries, :end_time
  end
end
