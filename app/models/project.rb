class Project < ActiveRecord::Base
  has_many :time_entries

  validates :name, :max_allowed_hours, presence: true

  def overtime?
    true if self.hours_worked > self.max_allowed_hours
  end

  def no_time_entries?
    true unless self.time_entries == []
  end

  def hours_worked
    TimeEntry.where('project_id = ?', self.id).sum(:duration)
  end
end
