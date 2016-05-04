class Developer < ActiveRecord::Base
  has_many :time_entries
  has_many :projects, through: :time_entries

  validates :email, presence: :true, uniqueness: true
  validates :password, confirmation: true

  # Read users password
  def password
    BCrypt::Password.new(password_hash)
  end

  # Write user password to DB
  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_hash = @password
  end
end
