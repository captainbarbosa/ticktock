class Developer < ActiveRecord::Base
  validates :email, presence: :true, uniqueness: true
  validates :password, confirmation: true

  # Read users password
  def password
    BCrypt::Password.new(password_hash)
  end

  # Set user's password
  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_hash = @password
  end
end
