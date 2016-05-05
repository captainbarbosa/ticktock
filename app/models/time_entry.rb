class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project

  validates :subject, :project_id, presence: true
end
