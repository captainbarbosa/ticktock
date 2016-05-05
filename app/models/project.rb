class Project < ActiveRecord::Base
  has_many :time_entries

  validates :name, :max_allowed_hours, presence: true
end
