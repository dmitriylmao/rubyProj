class User < ActiveRecord::Base
  validates :username, :email, presence: true, uniqueness: true
  validates :role, presence: true
  has_secure_password
end
