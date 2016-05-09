class Developer < ActiveRecord::Base
  has_many :time_entries
  has_many :projects, through: :time_entries

  validates :email, presence: :true, uniqueness: true
  validates :password, confirmation: true
  validates :first_name, :last_name, presence: :true

  # Read users password
  def password
    BCrypt::Password.new(password_hash)
  end

  # Write user password to DB
  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_hash = @password
  end

  def no_time_entries?
    time_entries.empty?
  end

  def weekly_hours
    self.time_entries.where('created_at >= ?', 1.week.ago).sum(:duration)
  end

  def overtime?
    self.weekly_hours > 40
  end

  def overtime_by
    weekly_hours - 40 if self.overtime?
  end
end
