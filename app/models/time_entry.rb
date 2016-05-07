class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project

  validates :subject, :duration, :project_id, presence: true
end
