class AddHoursCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :hours_worked, :integer
  end
end
