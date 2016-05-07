class Project < ActiveRecord::Base
  has_many :time_entries

  validates :name, :max_allowed_hours, presence: true

  def overtime?
    if self.hours_worked.nil?
      false
    else
      true unless self.hours_worked > self.max_allowed_hours
    end
  end

  def no_time_entries?
    true unless self.time_entries == []
  end
end
