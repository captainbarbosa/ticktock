class Project < ActiveRecord::Base
  has_many :time_entries

  validates :name, :max_allowed_hours, presence: true

  def overtime?
    true unless self.hours_worked > self.max_allowed_hours
  end
end
