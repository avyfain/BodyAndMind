class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  attr_accessible :email, :password 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate(email="", password="")
    user = User.find_by_email(email)
    return user && user.password == password
  end
end

