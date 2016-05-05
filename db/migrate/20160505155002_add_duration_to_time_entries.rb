class AddDurationToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :duration, :datetime
  end
end
