class TimeEntry < ActiveRecord::Base
  belongs_to :developer
  belongs_to :project
end
