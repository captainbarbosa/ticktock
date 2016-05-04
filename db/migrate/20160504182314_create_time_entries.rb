class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.string :subject
      t.datetime :start_time
      t.datetime :end_time
      t.integer :project_id
      t.integer :developer_id

      t.timestamps null: false
    end
  end
end
