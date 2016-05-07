class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :hours_worked, :default => 0
      t.integer :max_allowed_hours

      t.timestamps null: false
    end
  end
end
