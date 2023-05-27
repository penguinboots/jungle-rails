class User < ApplicationRecord
  has_secure_password

  # Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
  validates :email, presence: true, uniqueness: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.downcase.strip)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end
end
