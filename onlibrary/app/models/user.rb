class User < ActiveRecord::Base
  validates :username, :email, :password, presence: true, uniqueness: true
  has_secure_password
end
