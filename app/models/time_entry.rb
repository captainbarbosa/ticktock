class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project

  validates :subject, :start_time, :end_time, :project_id, presence: true
end
